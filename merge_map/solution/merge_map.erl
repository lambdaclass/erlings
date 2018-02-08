-module(merge_map).

-export([merge/2]).


merge(#{}, M2) ->
    M2;
merge(M1, M2) ->
    Keys1 = maps:keys(M1),
    Keys2 = maps:keys(M2),
    todo.
