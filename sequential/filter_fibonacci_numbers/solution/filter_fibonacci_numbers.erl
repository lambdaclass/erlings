-module(filter_fibonacci_numbers).

-export([filter/1]).

fibonacci(1) ->
    1;
fibonacci(2) ->
    2;
fibonacci(N) when N > 2 ->
    fibonacci(N-1) + fibonacci(N-2).

is_fibonacci_number(X) ->
    is_fibonacci_number(X, []).
is_fibonacci_number(X, []) ->
    F1 = fibonacci(1),
    case X =:= F1 of
        true ->
            true;
        false ->
            is_fibonacci_number(X, [fibonacci(1)])
    end;
is_fibonacci_number(X, Fibs) ->
    Fn = fibonacci(length(Fibs)),
    case X =:= Fn of
        true ->
            true;
        false when X > Fn ->
            is_fibonacci_number(X, [Fn|Fibs]);
        _ -> false
    end.

filter(L) ->
    [X || X <- L, is_fibonacci_number(X)].
