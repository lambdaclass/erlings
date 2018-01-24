-module(bitly_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    bitly_shortener:start_link(),
    Dispatch = cowboy_router:compile(
                 [
                  {'_', [
                         {"/:url", bitly_short_link_handler, []}
                        ]}
                 ]),
    {ok, _} = cowboy:start_clear(http, [{port, 8080}], #{
		env => #{dispatch => Dispatch}
	}),
    bitly_sup:start_link().

stop(_State) -> ok.


