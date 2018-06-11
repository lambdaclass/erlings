-module(filter_numbers_test).

-include_lib("eunit/include/eunit.hrl").

filter_numbers_in_test() ->
  List = [7, 14, 21, 28, 35, 42, 49, 56, 63, 70, 77, 84, 91, 98],
  ?assertEqual(List, filter_numbers:filter_in(1, 100, 7)).

filter_numbers_out_test() ->
  List = [1, 2, 3, 4, 5, 6, 8, 9, 10],
  ?assertEqual(List, filter_numbers:filter_out(1, 10, 7)).

filter_numbers_in_values_test() ->
  List = [25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38],
  ?assertEqual(List, filter_numbers:filter_in_values(1, 100, {25, 38})).
