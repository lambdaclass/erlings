-module(records_to_maps).
-export([records_to_maps/1]).
-record(person, {name, age}).

records_to_maps(Records) ->
	lists:map(fun(#person{name = Name, age = Age}) ->
							#{name => Name, age => Age} end,
						Records).
