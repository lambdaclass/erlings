-module(reduce).

-export([my_foldr/3,
         my_foldr/2]).

-include_lib("eunit/include/eunit.hrl").

% with accumulator
my_foldr(_, Acc, []) -> Acc;
my_foldr(Fun, Acc, [A | T]) ->
    NewAcc = Fun(A,Acc),
    my_foldr(Fun,NewAcc,T).

% w/o accumulator
my_foldr(_, List) when length(List) < 2 -> undefined;
my_foldr(Fun, [A, B | T]) ->
    my_foldr(Fun, A, [B | T]).


foldr_multiply_test() ->
    Multiply = fun (A, B) -> A * B end,
    300 = my_foldr(Multiply,10,[2,5,3]).

foldr_add_without_acc_test() ->
    Add = fun (A, B) -> A + B end,
    100 = my_foldr(Add,[20,20, 10, 50]).

