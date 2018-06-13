-module(shortly_app).

-behaviour(application).

-export([start/2,
         stop/1,
         install/1]).

-record(shortly_urls, {hash, url}).

start(_StartType, _StartArgs) ->
    {ok, Port} = application:get_env(shortly, port),
    Dispatch = cowboy_router:compile(
                 [
                  {'_', [
                         {"/news", shortly_ws_handler, []},
                         {"/:url", shortly_link_handler, []}
                        ]}
                 ]),
    {ok, _} = cowboy:start_clear(http, [{port, Port}], #{
		env => #{dispatch => Dispatch}
	}),
    shortly_sup:start_link().

stop(_State) ->
    cowboy:stop_listener(http),
    ok.

install(Nodes) ->
    mnesia:stop(),
    rpc:multicall(Nodes, application, stop, [mnesia]),
    ok = mnesia:create_schema([node() | Nodes]),
    mnesia:start(),
    rpc:multicall(Nodes, application, start, [mnesia]),
    mnesia:create_table(shortly_urls,
      [{attributes, record_info(fields, shortly_urls)},
       {type, set},
       {ram_copies, Nodes}]),
    mnesia:stop().
