-module(poolie_server).

-behaviour(gen_server).

-export([start/2, stop/0, start_link/2, run/3, run/2, pool_info/0]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-record(state, {limit, sup, idle=gb_sets:empty(), busy=gb_sets:empty()}).
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

start(PoolSize, Sup) ->
  gen_server:start({local, ?SERVER}, ?MODULE, {PoolSize, Sup}, []).

start_link(PoolSize, Sup) ->
  gen_server:start_link({local, ?SERVER}, ?MODULE, {PoolSize, Sup}, []).

stop() ->
  gen_server:call({local, ?SERVER}, stop).

%% gen_server callbacks

init({PoolSize, Sup}) ->
  self() ! {start_worker_supervisor, Sup},
  {ok, #state{limit=PoolSize}}.

handle_call({work, MFA}, _From, S = #state{idle=Idle, busy=Busy}) ->
  case gb_sets:size(Idle) >= 1 of
    true -> 
      Msg = "Request is being processed~n",
      {Worker, Rest} = gb_sets:take_smallest(Idle),
      NewState = S#state{idle=Rest, busy=gb_sets:add(Worker, Busy)},
      gen_server:cast(Worker, {work, MFA});
    false ->
      Msg = "No idle workers at the moment, please try again later~n",
      NewState = S
  end,
  {reply, Msg, NewState};

handle_call(info, _From, S = #state{limit=Limit, idle=Idle, busy=Busy}) ->
  {reply, {Limit, gb_sets:size(Idle), gb_sets:size(Busy)}, S};

handle_call(stop, _From, State) ->
  {stop, normal, stopped, State};

handle_call(_Request, _From, State) ->
  {reply, ok, State}.

handle_cast({result, {Worker, MFA, Result}}, S = #state{idle=Idle, busy=Busy}) ->
  io:format("Got results for ~p:~nResult: ~p~n", [MFA, Result]),
  {noreply, S#state{idle=gb_sets:add(Worker, Idle), busy=gb_sets:delete(Worker, Busy)}};

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
  {noreply, S#state{sup=Pid, idle=start_workers(Pid, Limit, gb_sets:new())}};

handle_info(_Info, State) ->
  {noreply, State}.

terminate(_Reason, _State) ->
  ok.

code_change(_OldVsn, State, _Extra) ->
  {ok, State}.

start_workers(_WorkerSup, 0, Workers) -> 
  Workers;
start_workers(WorkerSup, N, Workers) ->
  {ok, Pid} = supervisor:start_child(WorkerSup, [?SERVER]),
  start_workers(WorkerSup, N-1, gb_sets:add(Pid, Workers)).
