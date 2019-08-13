-module(maps_exercises).
-export([sum_of_values/1,return_values/1,sort_by_keys/1,min_value/1,merge/2, map/2, to_map/1, records_to_maps/1, maps_to_records/1, proplist_to_map/1]).
-record(person, {name, age}).

%% Return the sum of all values in a list
sum_of_values(Map) ->
    maps:fold(fun(_K,V,AccIn) -> AccIn + V end, 0, Map).

%% Min value
min_value(Map) ->
    Keys = maps:keys(Map),
    min_value(Keys, Map, []).

min_value([], _Map, Acc)-> lists:min(Acc);
min_value([H|T], Map, Acc) ->
    Element = maps:find(H, Map),
    {_Atom, Value} = Element,
    min_value(T, Map, [Value|Acc]).

%% Order Map
sort_by_keys(Map)->
    List = maps:keys(Map),
    OrderedL = lists:sort(List),
    get_value(OrderedL, Map, []).

get_value([], _Map, Acc)-> 
    NewMap = lists:reverse(Acc),
    maps:from_list(NewMap);

get_value([H|T], Map, Acc) ->
    Value = maps:get(H, Map),
    Tuple = {H, Value},
    get_value(T, Map, [Tuple|Acc]).

%% Values to list
return_values(Map) ->
    List = maps:keys(Map),
    get_values(List, Map, []).

get_values([], _Map, Acc) ->
    lists:reverse(Acc);
get_values([H|T], Map, Acc)->
    Value = maps:get(H, Map),
    get_values(T, Map, [Value|Acc]).

%% Merge map
merge(Map1, Map2) ->
  maps:fold(fun maps:put/3, Map1, Map2).

%% Mapping a map
map(F, Map)  ->
  List_Of_Tuples = maps:to_list(Map),
  Mapped_List = lists:keymap(F, 2, List_Of_Tuples),
  maps:from_list(Mapped_List).

%% List to map
to_map([]) ->
  #{};
to_map([H|T]) ->
  to_map(2, #{1 => H}, T).

to_map(_, Map, []) ->
  Map;
to_map(N, Map, [H|T]) ->
  to_map(N+1, maps:put(N, H, Map), T).

%% Records to maps
records_to_maps(Records) ->
  lists:map(fun(#person{name = Name, age = Age}) ->
              #{name => Name, age => Age} end,
            Records).

%% Maps to records
maps_to_records(Maps) ->
  maps_to_records([], Maps).
maps_to_records(Acc, []) ->
  Acc;
maps_to_records(Acc, [#{name := Name, age := Age} | Tail]) ->
  maps_to_records([#person{name = Name, age = Age} | Acc], Tail).

%% Proplist to map
proplist_to_map(Proplist) ->
  lists:foldl(fun({K, V}, Map) ->
                Map#{K => V} end,
              #{}, Proplist).
