-module(maps_exercises_test).
-record(person, {name, age}).
-include_lib("eunit/include/eunit.hrl").

sum_of_values_test()->
  Map = #{a=>1, b=> 5, c => 6, d => 5},
  ?assertEqual(17, maps_exercises:sum_of_values(Map)).

min_value_test()->
  Map = #{a=> 5, b=> 3, c=> 4, d=>2},
  ?assertEqual(2, maps_exercises:min_value(Map)).

sort_by_keys_test()->
  Map = #{1 => a, 5=> c, 3=> d, 7=> f},
  OrderedM = #{1=>a,3=>d,5=>c,7=>f},
  ?assertEqual(OrderedM, maps_exercises:sort_by_keys(Map)).

return_values_test()->
  Map = #{a=>1, b=>5, c=>3},
  List = [1,5,3],
  ?assertEqual(List, maps_exercises:return_values(Map)).

merge_empty_test() ->
  Map = #{a => 1, b => 2, c => 3},
  ?assertEqual(Map, maps_exercises:merge(#{}, Map)),
  ?assertEqual(Map, maps_exercises:merge(Map, #{})).

merge_update_test() ->
  Map1 = #{a => 1, b => 2, c => 3},
  Map2 = #{b => 6, d => 4},
  Map3 = #{a => 1, b => 6, c => 3, d => 4},
  ?assertEqual(Map3, maps_exercises:merge(Map1, Map2)).

map_empty_map_test() ->
  F = fun(X) -> X + 1 end,
  ?assertEqual(#{}, maps_exercises:map(F, #{})).

map_add_1_test() ->
  F = fun(X) -> X + 1 end,
  Map = #{a => 1, b => 2, c => 3},
  Res = #{a => 2, b => 3, c => 4},
  ?assertEqual(Res, maps_exercises:map(F, Map)).

to_map_test() ->
  List = [2, 23, a],
  Map = #{1 => 2, 2 => 23, 3 => a},
  ?assertEqual(Map, maps_exercises:to_map(List)).

to_map_empty_test() ->
  ?assertEqual(#{}, maps_exercises:to_map([])).

records_to_maps_test() ->
  Records = [#person{name="Pepe", age=28}, #person{name="Luis", age=77}],
  Maps = [#{age => 28,name => "Pepe"}, #{age => 77,name => "Luis"}],
  ?assertEqual(Maps, maps_exercises:records_to_maps(Records)).

records_to_maps_empty_test() ->
  ?assertEqual([], maps_exercises:records_to_maps([])).

maps_to_records_test() ->
  Records = [#person{name="Pepe", age=28}, #person{name="Luis", age=77}],
  Maps = [#{age => 77,name => "Luis"}, #{age => 28,name => "Pepe"}],
  ?assertEqual(Records, maps_exercises:maps_to_records(Maps)).

maps_to_records_empty_test() ->
  ?assertEqual([], maps_exercises:maps_to_records([])).

proplist_to_map_test() ->
  Proplist = [{firstname, "Pedro"}, {lastname, "Sanches"}, {age, 11}],
  Map = #{age => 11,firstname => "Pedro",lastname => "Sanches"},
  ?assertEqual(Map, maps_exercises:proplist_to_map(Proplist)).

proplist_to_map_empty_test() ->
  ?assertEqual(#{}, maps_exercises:proplist_to_map([])).
