-module(maps_to_records).
-export([maps_to_records/1]).
-record(person, {name, age}).

maps_to_records(Maps) ->
	maps_to_records([], Maps).
maps_to_records(Acc, []) ->
	Acc;
maps_to_records(Acc, [#{name := Name, age := Age} | Tail]) ->
	maps_to_records([#person{name = Name, age = Age} | Acc], Tail).
