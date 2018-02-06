-module(rotations_test).

-include_lib("eunit/include/eunit.hrl").

-compile(export_all).
-compile(nowarn_export_all).

rotations_right_test() ->
    [3, 4, 5, 1, 2] = rotations:rotate([1, 2, 3, 4, 5], {right, 2}).

rotations_left_test() ->
    [4, 5, 1, 2, 3] = rotations:rotate([1, 2, 3, 4, 5], {right, 2}).
