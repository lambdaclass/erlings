-module(any_test).

-include_lib("eunit/include/eunit.hrl").

any_is_even_test() ->
    List = [2, 3, 4, 1, 5, 6, 9],
    ?assert(any:list_any(fun(X) -> X rem 2 == 0 end, List)).

any_empty_test() ->
    ?assertNot(any:list_any(fun(X) -> X == 20 end, [])).
