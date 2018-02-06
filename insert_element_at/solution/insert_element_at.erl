-module(insert_element_at).

-export([insert/3]).

insert([H|T], Pos, Element) ->
  insert(Pos, Element, H, [], T).

insert(1, NewElement, CurrentElement, Pre, Post) ->
  Pre ++ [replace(CurrentElement, NewElement)] ++ Post;
insert(Pos, NewElement, CurrentElement, Pre, [PostH|PostT]) ->
  insert(Pos - 1, NewElement, PostH, Pre ++ [CurrentElement], PostT).

replace(#{current := Old, old := _}, NewElement) ->
  #{current => NewElement, old => Old};
replace(Element, NewElement) ->
  #{current => NewElement, old => Element}.
