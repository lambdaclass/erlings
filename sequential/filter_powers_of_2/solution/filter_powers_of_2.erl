-module(filter_powers_of_2).

-export([filter_powers/1]).

is_power_of_2(X) ->
    math:ceil(math:log2(X)) =:= math:floor(math:log2(X)).

filter_powers(L) ->
    [X || X <- L, is_power_of_2(X)].
