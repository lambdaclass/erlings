-module(poolie_server).

-behaviour(gen_server).

-export([start_link/2, stop/0, run/3, run/2, pool_info/0]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2]).

-record(state, {limit, sup, idle=queue:new()}).
-define(SERVER, ?MODULE).

%% API

run(M, F, A) when is_list(A) ->
  Msg = gen_server:call(?SERVER, {work, {M, F, A}}),
  io:format(Msg).

run(F, A) when is_function(F), is_list(A) ->
  Msg = gen_server:call(?SERVER, {work, {F, A}}),
  io:format(Msg).

pool_info() ->
  {PoolSize, Idle, Busy} = gen_server:call(?SERVER, info),
  io:format("Pool has ~p workers.~nThere are ~p idle and ~p busy workers.~n", [PoolSize, Idle, Busy]).

start_link(PoolSize, Sup) ->
  gen_server:start_link({local, ?SERVER}, ?MODULE, {PoolSize, Sup}, []).

stop() ->
  gen_server:call({local, ?SERVER}, stop).

%% gen_server callbacks

init({PoolSize, Sup}) ->
  self() ! {start_worker_supervisor, Sup},
  {ok, #state{limit=PoolSize}}.

handle_call({work, MFA}, _From, S = #state{idle=Idle}) ->
  case queue:out(Idle) of
    {{value, Worker}, Rest} -> 
      Msg = "Request is being processed~n",
      NewState = S#state{idle=Rest},
      gen_server:cast(Worker, {work, MFA});
    {empty, Idle} ->
      Msg = "No idle workers at the moment, please try again later~n",
      NewState = S
  end,
  {reply, Msg, NewState};

handle_call(info, _From, S = #state{limit=Limit, idle=Idle}) ->
  IdleWorkers = queue:len(Idle),
  {reply, {Limit, IdleWorkers, Limit - IdleWorkers}, S};

handle_call(stop, _From, State) ->
  {stop, normal, stopped, State};

handle_call(_Request, _From, State) ->
  {reply, ok, State}.

handle_cast({result, {Worker, MFA, Result}}, S = #state{idle=Idle}) ->
  io:format("Got results for ~p:~nResult: ~p~n", [MFA, Result]),
  {noreply, S#state{idle=queue:in(Worker, Idle)}};

handle_cast(_Msg, State) ->
  {noreply, State}.

handle_info({start_worker_supervisor, Sup}, S = #state{limit=Limit}) ->
  Spec = {poolie_worker_sup,
         {poolie_worker_sup, start_link, []},
          permanent,
          10000,
          supervisor,
          [poolie_worker_sup]},
  {ok, Pid} = supervisor:start_child(Sup, Spec),
  {noreply, S#state{sup=Pid, idle=start_workers(Pid, Limit, queue:new())}};

handle_info(_Info, State) ->
  {noreply, State}.

start_workers(_WorkerSup, 0, Workers) -> 
  Workers;
start_workers(WorkerSup, N, Workers) ->
  {ok, Pid} = supervisor:start_child(WorkerSup, [?SERVER]),
  start_workers(WorkerSup, N-1, queue:in(Pid, Workers)).
