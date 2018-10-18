-module(maps_exercises).

-record(person, {name, age}).

-export([map/2, maps_to_records/1, merge/2,
	 proplist_to_map/1, records_to_maps/1, to_map/1]).

merge(M1, M2) -> maps:fold(fun (K, V, Map) -> maps:put(K, V, Map) end, M1, M2).

map(Function, Map) ->
    maps:fold(fun (K, V, NewMap) -> maps:put(K, Function(V), NewMap) end, #{}, Map).

to_map(List) -> to_map(List, 1, #{}).

to_map([], _Index, Map) -> Map;
to_map([Head | Tail], Index, Map) ->
    to_map(Tail, Index + 1, maps:put(Index, Head, Map)).

records_to_maps(Records) ->
    lists:map(fun (#person{name = Name, age = Age}) -> #{name => Name, age => Age} end, Records).

maps_to_records(Maps) -> maps_to_records(Maps, []).

maps_to_records([], Persons) -> Persons;
maps_to_records([#{age := Age, name := Name} | Tail], Persons) ->
    maps_to_records(Tail, [#person{name = Name, age = Age} | Persons]).

proplist_to_map(Proplist) -> proplist_to_map(Proplist, #{}).

proplist_to_map([], Map) -> Map;
proplist_to_map([{Key, Value} | Tail], Map) -> 
    proplist_to_map(Tail, maps:put(Key, Value, Map)).
