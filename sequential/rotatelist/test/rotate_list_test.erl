-module(rotate_list_test).

-include_lib("eunit/include/eunit.hrl").

rotate_list_right_test() ->
    Res = [3, 4, 5, 1, 2],
    ?assertEqual(Res, rotate_list:rotate([1, 2, 3, 4, 5], {right, 2})).

rotate_list_left_test() ->
    Res = [4, 5, 1, 2, 3],
    ?assertEqual(Res, rotate_list:rotate([1, 2, 3, 4, 5], {left, 2})).
