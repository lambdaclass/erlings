-module(rmconsecutive).

-export([rm/1]).

rm([]) ->
    [];
rm([H|T]) ->
    rm(H, T).

rm(E, []) ->
    [E];
rm(E, [E|T]) ->
    rm(E,T);
rm(E, [H|T]) ->
    [E| rm(H,T)].
