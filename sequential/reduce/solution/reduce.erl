-module(reduce).

-export([my_foldl/3,
         my_foldl/2]).

% with accumulator
my_foldl(_, Acc, []) -> Acc;
my_foldl(Fun, Acc, [A | T]) ->
    NewAcc = Fun(A,Acc),
    my_foldl(Fun,NewAcc,T).

% w/o accumulator
my_foldl(_, List) when length(List) < 2 -> undefined;
my_foldl(Fun, [A, B | T]) ->
    my_foldl(Fun, A, [B | T]).
