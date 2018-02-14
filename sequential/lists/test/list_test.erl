-module(list_test).

-include_lib("eunit/include/eunit.hrl").

run_length_encoding_test() ->
    List = [a, a, a, a, b, c, c, a, a, d, e, e, e, e],
    Res = [[4, a], [1, b], [2, c], [2, a], [1, d], [4, e]],
    ?assertEqual(Res, list:run_length_encode(List)).

rotate_list_right_test() ->
    Res = [3, 4, 5, 1, 2],
    ?assertEqual(Res, list:rotate([1, 2, 3, 4, 5], {right, 2})).

rotate_list_left_test() ->
    Res = [4, 5, 1, 2, 3],
    ?assertEqual(Res, list:rotate([1, 2, 3, 4, 5], {left, 2})).

rmconsecutive_test() ->
    List = [1, 1, 1, 2, 3, 4, 1, 1, 1, 3],
    ?assertEqual([1,2,3,4,1,3], list:rmconsecutibe(List)).

all_the_same_test() ->
  ?assertEqual([1, 1, 1, 1], list:reverse([1, 1, 1, 1])).

all_different_test() ->
 ?assertEqual([5, 4, 3, 2, 1], list:reverse([1, 2, 3, 4, 5])).

foldl_multiply_test() ->
    Multiply = fun (A, B) -> A * B end,
    ?assertEqual(300, list:foldl(Multiply, 10, [2, 5, 3])).

foldl_add_without_acc_test() ->
    Add = fun (A, B) -> A + B end,
    ?assertEqual(100, list:foldl(Add, [20, 20, 10, 50])).

even_fib_numbers_test() ->
    ?assertEqual(4613732, list:even_fib_numbers()).

any_is_even_test() ->
    List = [2, 3, 4, 1, 5, 6, 9],
    ?assert(list:list_any(fun(X) -> X rem 2 == 0 end, List)).

any_empty_test() ->
    ?assertNot(list:list_any(fun(X) -> X == 20 end, [])).