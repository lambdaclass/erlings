-module(filter_fibonacci_numbers).

-export([filter/1]).

filter(List) ->
    FibList = fib_less_than(lists:max(List)),
    [X || X <- List, lists:member(X, FibList)].

fib_less_than(N) -> fib_less_than(N, 1, 1, []).

fib_less_than(N, Current, Next, Acc) when Current =< N -> 
    fib_less_than(N, Next, Current + Next, [Current | Acc]);
fib_less_than(_N, _Current, _Next, Acc) ->
    Acc.
