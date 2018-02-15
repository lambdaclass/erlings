-module(insert_element_at_test).

-include_lib("eunit/include/eunit.hrl").

insertion_test() ->
  [1, #{current := "hi", old := 2}, 3] =
    insert_element_at:insert([1, 2, 3], 2, "hi"),
  [1, #{current := "hi", old := 10}, 3] =
    insert_element_at:insert([1, #{current => 10, old => 2}, 3], 2, "hi").
