-module(installing_test).

-include_lib("eunit/include/eunit.hrl").

installing_test() ->
  ?assertEqual('i can not wait for more code', installing:installed()).
