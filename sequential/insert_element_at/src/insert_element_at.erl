-module(insert_element_at).

-export([insert/3]).

insert(List, Pos, Element) ->
    insert(List, Pos, Element, 1, []).

insert([], _Pos, _Element, _Index, _Acc) -> [];
insert([#{current := Current, old := _Old} | Tail], Pos,
       Element, Pos, Acc) ->
    lists:reverse(Acc) ++
      [#{current => Element, old => Current}] ++ Tail;
insert([Head | Tail], Pos, Element, Pos, Acc) ->
    Acc ++ [#{current => Element, old => Head}] ++ Tail;
insert([Head | Tail], Pos, Element, Index, Acc) ->
    insert(Tail, Pos, Element, Index + 1, [Head | Acc]).
