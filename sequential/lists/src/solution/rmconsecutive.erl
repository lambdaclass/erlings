-module(rmconsecutive).

-export([rmconsecutive/1]).

rmconsecutive([]) ->
    [];
rmconsecutive([H|T]) ->
    rmconsecutive(H, T).

rmconsecutive(E, []) ->
    [E];
rmconsecutive(E, [E|T]) ->
    rmconsecutive(E,T);
rmconsecutive(E, [H|T]) ->
    [E| rmconsecutive(H,T)].
