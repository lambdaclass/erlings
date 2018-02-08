-module(any_test).

-include_lib("eunit/include/eunit.hrl").

-compile(export_all).
-compile(nowarn_export_all).

any_test_1() ->
    List = [2, 3, 4, 1, 5, 6, 9],
    true =  any:list_any(fun(X) -> X rem 2 == 0 end, List).

any_test_2() ->
    true = any:list_any(fun(X) -> X == 20 end, []).
