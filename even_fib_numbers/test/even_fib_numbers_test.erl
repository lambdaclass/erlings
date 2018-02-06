-module(even_fib_numbers_test).

-include_lib("eunit/include/eunit.hrl").

-compile(export_all).
-compile(nowarn_export_all).

even_fib_numbers_test() ->
    4613732 = even_fib_numbers:even_fib_numbers().
