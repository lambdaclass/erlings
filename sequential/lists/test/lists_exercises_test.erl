-module(lists_exercises_test).

-include_lib("eunit/include/eunit.hrl").

all_the_same_test() ->
  ?assertEqual([1, 1, 1, 1], lists_exercises:reverse([1, 1, 1, 1])).

all_different_test() ->
 ?assertEqual([5, 4, 3, 2, 1], lists_exercises:reverse([1, 2, 3, 4, 5])).

rmconsecutive_test() ->
  List = [1, 1, 1, 2, 3, 4, 1, 1, 1, 3],
  ?assertEqual([1,2,3,4,1,3], lists_exercises:rmconsecutive(List)).

even_fib_numbers_test() ->
  ?assertEqual(4613732, lists_exercises:even_fib_numbers()).

foldl_multiply_test() ->
  Multiply = fun (A, B) -> A * B end,
  ?assertEqual(300, lists_exercises:foldl(Multiply, 10, [2, 5, 3])).

foldl_add_without_acc_test() ->
  Add = fun (A, B) -> A + B end,
  ?assertEqual(100, lists_exercises:foldl(Add, [20, 20, 10, 50])).

rotate_list_right_test() ->
  Res = [4, 5, 1, 2, 3],
  ?assertEqual(Res, lists_exercises:rotate([1, 2, 3, 4, 5], {right, 2})).

rotate_list_left_test() ->
  Res = [3, 4, 5, 1, 2],
  ?assertEqual(Res, lists_exercises:rotate([1, 2, 3, 4, 5], {left, 2})).

run_length_encoding_test() ->
  List = [a, a, a, a, b, c, c, a, a, d, e, e, e, e],
  Res = [{4, a}, {1, b}, {2, c}, {2, a}, {1, d}, {4, e}],
  ?assertEqual(Res, lists_exercises:run_length_encode(List)).

any_is_even_test() ->
  List = [2, 3, 4, 1, 5, 6, 9],
  ?assert(lists_exercises:list_any(fun(X) -> X rem 2 == 0 end, List)).

any_empty_test() ->
    ?assertNot(lists_exercises:list_any(fun(X) -> X == 20 end, [])).

anagram_test() ->
    List = ["Panel", "plane", "Penal", "PlenA", "Nepal", "ArgentinA", "Laos"],
    String = "Nepal",
    Res = ["Panel", "plane", "Penal", "PlenA"],
    ?assertEqual(Res, lists_exercises:anagram(List,String)).

last_letter_test()->
  List = ["Afghanistan", "Albania", "Algeria", "Andorra", "Nigeria", "Norway", 
          "Yemen", "Nepal", "Morocco", "Oman", "Portugal", "Spain"],
  Res = ["Afghanistan","Nigeria","Algeria","Andorra"],
  ?assertEqual(Res, lists_exercises:last_letter(List)).
