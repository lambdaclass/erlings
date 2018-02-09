-module(reduce_test).

-include_lib("eunit/include/eunit.hrl").

foldl_multiply_test() ->
    Multiply = fun (A, B) -> A * B end,
    ?assertEqual(300, reduce:my_foldl(Multiply, 10, [2, 5, 3])).

foldl_add_without_acc_test() ->
    Add = fun (A, B) -> A + B end,
    ?assertEqual(100, reduce:my_foldl(Add, [20, 20, 10, 50])).
