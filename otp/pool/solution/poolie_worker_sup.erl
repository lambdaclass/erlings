-module(poolie_worker_sup).

-behaviour(supervisor).

-export([start_link/0, init/1]).

start_link() ->
  supervisor:start_link(?MODULE, []).

init([]) ->
  {ok, {{simple_one_for_one, 5, 500}, [{poolie_worker, {poolie_worker, start_link, []}, 
  permanent, 5000, worker, [poolie_worker]}]}}.
