-module(shortly_app).

-behaviour(application).

-export([start/2, 
         stop/1]).

start(_StartType, _StartArgs) ->
    Dispatch = cowboy_router:compile(
                 [
                  {'_', [
                         {"/news", shortly_ws_handler, []},
                         {"/:url", shortly_link_handler, []}
                        ]}
                 ]),
    {ok, _} = cowboy:start_clear(http, [{port, 8080}], #{
		env => #{dispatch => Dispatch}
	}),
    shortly_sup:start_link().

stop(_State) -> 
    cowboy:stop_listener(http),
    ok.
