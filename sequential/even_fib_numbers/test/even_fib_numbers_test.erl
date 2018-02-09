-module(even_fib_numbers_test).

-include_lib("eunit/include/eunit.hrl").

even_fib_numbers_test() ->
    ?assertEqual(4613732, even_fib_numbers:even_fib_numbers()).
