-module(merge_map_test).

-include_lib("eunit/include/eunit.hrl").

merge_map_empty_test() ->
    Map = #{a => 1, b => 2, c => 3},
    ?assertEqual(Map, merge_map:merge(#{}, Map)),
    ?assertEqual(Map, merge_map:merge(Map, #{})).

merge_map_update_test() ->
    Map1 = #{a => 1, b => 2, c => 3},
    Map2 = #{b => 6, d => 4},
    Map3 = #{a => 1, b => 6, c => 3, d => 4},
    ?assertEqual(Map3, merge_map:merge(Map1, Map2)).
