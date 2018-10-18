-module(insert_element_at).

-export([insert/3]).

insert(List, Pos, Element) -> insert(List, Pos, Element, []).

insert([], _Pos, _Element, _Acc) -> [];
insert([#{current := Current, old := _Old} | Tail], 1, Element, Acc) ->
    lists:reverse(Acc) ++
      [#{current => Element, old => Current}] ++ Tail;
insert([Head | Tail], 1, Element, Acc) ->
    Acc ++ [#{current => Element, old => Head}] ++ Tail;
insert([Head | Tail], Pos, Element, Acc) ->
    insert(Tail, Pos - 1, Element, [Head | Acc]).
