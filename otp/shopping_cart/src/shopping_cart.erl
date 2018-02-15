-module(shopping_cart).

-behaviour(gen_server).

-export([start_link/0,
         put_item/2,
         finish/1,
         cost_so_far/1,
        ]).

start_link() ->
     put_your_solution_here.

put_item(Pid, Item) ->
    put_your_solution_here.

cost_so_far(Pid) ->
    put_your_solution_here.

finish(Pid) ->
    put_your_solution_here.
