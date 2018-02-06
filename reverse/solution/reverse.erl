-module(reverse).

-export([r/1]).

r(List) -> reverse(List, []).

reverse([], Acc) -> Acc;
reverse([H|T], Acc) -> reverse(T, [H|Acc]).
