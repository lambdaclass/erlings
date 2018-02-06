-module(even_fib_numbers).

-compile([even_fib_numbers/0, even_fib_numbers_test/0]).

-include_lib("eunit/include/eunit.hrl").

fib(1) ->
    1;
fib(2) ->
    2;
fib(N) when N > 2 ->
    fib(N-1) + fib(N-2).

% list of every fibonacci number less than N.
fibs_less_than(N) when N < 1->
    [];
fibs_less_than(N) ->
    fibs_less_than(N, 1, []).

fibs_less_than(N, M, AccList) ->
    FibM = fib(M),
    case FibM < N of
	true ->
	    fibs_less_than(N, M+1, [ FibM | AccList]);
	false ->
	    AccList
    end.

even_fib_numbers() ->
    Less_than_4mill = fibs_less_than(4000000),
    Even_fibs = lists:filter(fun(X) -> X rem 2 == 0 end, Less_than_4mill),
    lists:sum(Even_fibs).

even_fib_numbers_test() ->
    4613732 = even_fib_numbers().
