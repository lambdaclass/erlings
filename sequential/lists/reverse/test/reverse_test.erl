-module(reverse_test).

-include_lib("eunit/include/eunit.hrl").

all_the_same_test() ->
  ?assertEqual([1, 1, 1, 1], reverse:r([1, 1, 1, 1])).

all_different_test() ->
 ?assertEqual([5, 4, 3, 2, 1], reverse:r([1, 2, 3, 4, 5])).
