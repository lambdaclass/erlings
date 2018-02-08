-module(list_to_map_test).

-include_lib("eunit/include/eunit.hrl").

-compile(export_all).
-compile(nowar_export_all).

list_to_map_test1() ->
    List = [2, 23, a],
    Map = #{1 => 2, 2 => 23, 3 => a},
    Map = list_to_map:to_map(List).

list_to_map_test2() ->
    #{} = list_to_map:to_map([]).
