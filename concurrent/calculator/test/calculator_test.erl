-module(calculator_test).

-include_lib("eunit/include/eunit.hrl").

calculator_add_test() ->
  Cal = calculator:start_calculator(),
  ?assertEqual(2+3, calculator:add(Cal, 2, 3)).

calculator_subtract_test() ->
  Cal = calculator:start_calculator(),
  ?assertEqual(2-3, calculator:subtract(Cal, 2, 3)).

calculator_multiply_test() ->
  Cal = calculator:start_calculator(),
  ?assertEqual(7*9, calculator:multiply(Cal, 7, 9)).

calculator_divide_test() ->
  Cal = calculator:start_calculator(),
  ?assertEqual(25/5, calculator:divide(Cal, 25, 5)).
