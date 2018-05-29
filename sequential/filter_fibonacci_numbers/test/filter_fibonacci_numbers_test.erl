-module(filter_fibonacci_numbers_test).

-include_lib("eunit/include/eunit.hrl").

filter_fibonacci_numbers_test() ->
  List = [1, 2, 3, 4, 5, 7, 8, 9, 10],
  ?assertEqual([1, 2, 3, 5, 8], filter_fibonacci_numbers:filter(List)).
