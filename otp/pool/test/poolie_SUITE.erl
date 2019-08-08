-module(poolie_SUITE).

-include_lib("common_test/include/ct.hrl").

-export([all/0]).
-export([run_eunit/1]).

all() ->
  [run_eunit].

run_eunit(_Config) ->
  {ok, _Pid} = application:ensure_all_started(poolie),
  ok = eunit:test(poolie_test).
