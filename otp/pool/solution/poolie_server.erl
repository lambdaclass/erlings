-module(poolie_server).

-behaviour(gen_server).

-export([start_link/0, stop/0, run/3, run/2, pool_info/0]).
-export([init/1, handle_call/3, handle_cast/2]).

-record(state, {limit, idle}).
-define(WORKERSUP, poolie_worker_sup).
-define(SERVER, ?MODULE).
-define(N, 10). %% Number of workers

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

start_link() ->
  gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

stop() ->
  gen_server:call({local, ?SERVER}, stop).

%% gen_server callbacks

init(_Args) ->
  Workers = poolie_worker_sup:add_workers(?N),
  {ok, #state{limit=?N, idle=Workers}}.

handle_call({work, MFA}, _From, S = #state{idle=[Worker | Rest]}) -> 
  Msg = "Request is being processed~n",
  gen_server:cast(Worker, {work, MFA}),
  {reply, Msg, S#state{idle=Rest}};

handle_call({work, _MFA}, _From, State) -> 
  Msg = "No idle workers at the moment, please try again later~n",
  {reply, Msg, State};

handle_call(info, _From, S = #state{limit=Limit, idle=Idle}) ->
  IdleWorkers = length(Idle),
  {reply, {Limit, IdleWorkers, Limit - IdleWorkers}, S};

handle_call(stop, _From, State) ->
  {stop, normal, stopped, State};

handle_call(_Request, _From, State) ->
  {reply, ok, State}.

handle_cast({result, {Worker, MFA, Result}}, S = #state{idle=Idle}) ->
  io:format("Got results for ~p~nResult: ~p~n", [MFA, Result]),
  {noreply, S#state{idle=[Worker | Idle]}};

handle_cast(_Msg, State) ->
  {noreply, State}.
