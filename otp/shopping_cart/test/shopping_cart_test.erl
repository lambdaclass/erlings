-module(shopping_cart_test).

-include_lib("eunit/include/eunit.hrl").

shopping_cart_add_item_test() ->
    {ok, Pid} = shopping_cart:start_link(),
    Orange = {orange, 3}, % tuple with name and price
    Ans = shopping_cart:put_item(Pid, Orange),
    ?assertEqual(Ans, [{orange, 3}]).

shopping_cart_calculate_cost_test() ->
    {ok, Pid} = shopping_cart:start_link(),
    Apple = {apple, 2},
    shopping_cart:put_item(Pid, Apple),
    Cost = shopping_cart:cost_so_far(Pid),
    ?assertEqual(Cost, 2).
