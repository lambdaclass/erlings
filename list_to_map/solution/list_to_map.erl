-module(list_to_map).

-export([to_map/1]).

to_map([]) ->
    #{};
to_map([H|T]) ->
    to_map(2, #{1 => H}, T).

to_map(_, Map, []) ->
    Map;
to_map(N, Map, [H|T]) ->
    to_map(N+1, maps:put(N, H, Map), T).


