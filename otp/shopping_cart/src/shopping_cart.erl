-module(shopping_cart).

-behaviour(gen_server).

-export([start_link/0,
         put_item/2,
         finish/1,
         cost_so_far/1,
         init/1,
         handle_call/3,
         terminate/2
        ]).

start_link() ->
    gen_server:start_link(?MODULE, [], []).

put_item(Pid, Item) ->
    gen_server:call(Pid, {put, Item}).

cost_so_far(Pid) ->
    gen_server:call(Pid, cost).

finish(Pid) ->
    gen_server:call(Pid, finish).

init(State) ->
    {ok, State}.

handle_call({put, Item}, _From, State) ->
    NewState = [Item | State],
    {reply, NewState, NewState};
handle_call(cost, _From, State) ->
    Cost = calculate_cost(State),
    {reply, Cost, State};
handle_call(finish, _From, State) ->
    {stop, normal, State}.

terminate(normal, State) ->
    io:format("The cost of all items was: ~p. ~n", calculate_cost(State)),
    ok.

calculate_cost(Items) ->
    lists:foldl(fun({_Item, Price}, Acc) -> Price + Acc end, 0, Items).
