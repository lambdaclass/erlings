-module(shopping_cart).

-behaviour(gen_server).

-export([start_link/0,
         put_item/2,
         finish/1,
         init/1,
         handle_call/3,
         terminate/2,
         cost_so_far/1,
	 handle_cast/2
        ]).

%% Client functions
start_link() ->
     gen_server:start_link(?MODULE, [], []).

put_item(Pid, Item) ->
    gen_server:call(Pid, {item, Item}).

cost_so_far(Pid) ->
    gen_server:call(Pid, cost).

finish(Pid) ->
    gen_server:call(Pid, terminate).

%% Server functions
init([]) ->
    {ok, []}.

handle_call({item, Item}, _From, Cart) ->
    {reply, [Item|Cart], [Item|Cart]};

handle_call(terminate, _From, Cart) ->
    {stop, normal, ok, Cart};

handle_call(cost, _From, Cart) ->
    Total_Price = total_price(Cart),
    {reply, Total_Price, Cart}.

handle_cast(_, _) ->
    {noreply, ok}.

terminate(normal, Cart) ->
    io:format("The total price was: ~p. ~n", [total_price(Cart)]),
    ok.

%% Private functions
total_price(Cart) ->
    Prices = lists:map(fun({_, Price}) -> Price end, Cart),
    lists:sum(Prices).
