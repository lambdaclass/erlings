-module(proplist_to_map).
-export([proplist_to_map/1]).


proplist_to_map(Proplist) ->
		lists:foldl(fun({K, V}, Map) ->
									Map#{K => V} end,
								#{}, Proplist).
