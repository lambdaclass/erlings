-module(parallel_map_test).

-include_lib("eunit/include/eunit.hrl").

parallel_map_result_test() ->
  Fun = fun(X) -> X * 10 end,
  List = [1, 2, 3, 4, 5],
  Result = lists:map(Fun, List),
  ?assertEqual(Result, parallel_map:pmap(Fun, List)).
