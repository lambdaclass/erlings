-module(shortly_app).

-behaviour(application).

-export([start/2,
         stop/1]).

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
