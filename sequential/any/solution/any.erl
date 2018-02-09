-module(any).

-export([list_any/2]).

list_any(F, List) ->
    lists:foldl(fun(X, Y) -> F(X) or Y end, false, List).
