-module(maps_exercises).
-export([merge/2, map/2, to_map/1, records_to_maps/1, maps_to_records/1, proplist_to_map/1]).
-record(person, {name, age}).


merge(Map1, Map2) ->
    maps:fold(fun maps:put/3, Map1, Map2).


map(F, Map)  ->
    List_Of_Tuples = maps:to_list(Map),
    Mapped_List = lists:keymap(F, 2, List_Of_Tuples),
    maps:from_list(Mapped_List).


to_map([]) ->
    #{};
to_map([H|T]) ->
    to_map(2, #{1 => H}, T).

to_map(_, Map, []) ->
    Map;
to_map(N, Map, [H|T]) ->
    to_map(N+1, maps:put(N, H, Map), T).


records_to_maps(Records) ->
	lists:map(fun(#person{name = Name, age = Age}) ->
							#{name => Name, age => Age} end,
						Records).


maps_to_records(Maps) ->
	maps_to_records([], Maps).
maps_to_records(Acc, []) ->
	Acc;
maps_to_records(Acc, [#{name := Name, age := Age} | Tail]) ->
	maps_to_records([#person{name = Name, age = Age} | Acc], Tail).


proplist_to_map(Proplist) ->
		lists:foldl(fun({K, V}, Map) ->
									Map#{K => V} end,
								#{}, Proplist).
