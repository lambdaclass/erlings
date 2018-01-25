-module(shortener_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    shortener_shortener:init(),
    Dispatch = cowboy_router:compile(
                 [
                  {'_', [
                         {"/:url", shortener_link_handler, []}
                        ]}
                 ]),
    {ok, _} = cowboy:start_clear(http, [{port, 8080}], #{
		env => #{dispatch => Dispatch}
	}),
    shortener_sup:start_link().

stop(_State) -> ok.
