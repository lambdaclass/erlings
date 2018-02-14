-module(mapping_a_map).

-export([map/2]).

map(F, Map)  ->
    List_Of_Tuples = maps:to_list(Map),
    Mapped_List = lists:keymap(F, 2, List_Of_Tuples),
    maps:from_list(Mapped_List).
