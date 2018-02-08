-module(mapping_a_map_test).


-include_lib("eunit/include/eunit.hrl").

-compile(export_all).
-compile(nowar_export_all).

mapping_a_map_empty_map_test() ->
    F = fun(X) -> X + 1 end,
    ?assertEqual(#{}, mapping_a_map:map(F, #{})).

mapping_a_map_add_1_test() ->
    F = fun(X) -> X + 1 end,
    Map = #{a => 1, b => 2, c => 3},
    Res = #{a => 2, b => 3, c => 4},
    ?assertEqual(Res, mapping_a_map:map(F, Map)).
