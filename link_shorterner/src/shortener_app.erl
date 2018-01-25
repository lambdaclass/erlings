-module(shortener_app).

-behaviour(application).

-export([start/2, 
         stop/1]).

start(_StartType, _StartArgs) ->
    Dispatch = cowboy_router:compile(
                 [
                  {'_', [
                         {"/news", shortener_ws_handler, []},
                         {"/:url", shortener_link_handler, []}
                        ]}
                 ]),
    {ok, _} = cowboy:start_clear(http, [{port, 8080}], #{
		env => #{dispatch => Dispatch}
	}),
    shortener_sup:start_link().

stop(_State) -> 
    cowboy:stop_listener(http),
    ok.
