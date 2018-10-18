-module(filter_fibonacci_numbers).

-export([filter/1]).

filter(List) ->
    FibList = fib_less_than(lists:max(List)),
    [X || X <- List, lists:member(X, FibList)].

fib_less_than(N) ->
    Fig_gen = fun Fib(I, J, Acc) ->
		      if I =< N -> Fib(J, I + J, [I | Acc]);
			 true -> Acc
		      end
	      end,
    Fig_gen(1, 1, []).
