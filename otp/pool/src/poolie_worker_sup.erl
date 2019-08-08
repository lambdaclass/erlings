-module(poolie_worker_sup).

-behaviour(supervisor).

-export([start_link/0, add_workers/1, init/1]).

%% API

start_link() ->
  supervisor:start_link({local, ?MODULE}, ?MODULE, []).

add_workers(N) when N >= 0 ->
  put_your_solution_here.

%% supervisor callbacks

init(_Args) ->
  Worker = worker_spec,
  {ok, {{worker_supervisor_strategy}, [Worker]}}.
