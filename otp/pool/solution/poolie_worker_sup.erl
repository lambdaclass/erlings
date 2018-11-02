-module(poolie_worker_sup).

-behaviour(supervisor).

-export([start_link/0, add_workers/1, init/1]).

-define(WORKERSUP, ?MODULE).

%% API

start_link() ->
  supervisor:start_link({local, ?WORKERSUP}, ?MODULE, []).

add_workers(N) when N >= 0 ->
  add_workers(N, []).

add_workers(0, Workers) ->
  Workers;
add_workers(N, Workers) ->
  {ok, Pid} = supervisor:start_child(?WORKERSUP, []),
  add_workers(N-1, [Pid | Workers]).

%% supervisor callbacks

init(_Args) ->
  {ok, {{simple_one_for_one, 5, 500}, [{poolie_worker, {poolie_worker, start, []}, 
  permanent, 5000, worker, [poolie_worker]}]}}.
