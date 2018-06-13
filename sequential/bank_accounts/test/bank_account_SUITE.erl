-module(bank_account_SUITE).

-include_lib("common_test/include/ct.hrl").

-export([all/0]).
-export([run_eunit/1]).

all() ->
  [run_eunit].

run_eunit(_Config) ->
  ok = eunit:test(bank_account_test).
