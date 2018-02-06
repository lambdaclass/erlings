-module(reverse_test).

-include_lib("eunit/include/eunit.hrl").

-compile(export_all).
-compile(nowarn_export_all).

all_the_same_test() ->
  [1, 1, 1, 1] = reverse:r([1, 1, 1, 1]).

all_different_test() ->
  [5, 4, 3, 2, 1] = reverse:r([1, 2, 3, 4, 5]).
