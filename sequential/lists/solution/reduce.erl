-module(reduce).

-export([foldl/3,
         foldl/2]).

% with accumulator
foldl(_, Acc, []) -> Acc;
foldl(Fun, Acc, [A | T]) ->
    NewAcc = Fun(A,Acc),
    foldl(Fun,NewAcc,T).

% w/o accumulator
foldl(_, List) when length(List) < 2 -> undefined;
foldl(Fun, [A, B | T]) ->
    foldl(Fun, A, [B | T]).
