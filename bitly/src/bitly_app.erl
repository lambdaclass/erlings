%%%-------------------------------------------------------------------
%% @doc bitly public API
%% @end
%%%-------------------------------------------------------------------

-module(bitly_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    ShortLink = {'_',[{"/",bitly_short_link_handler,[]}]},
    Dispath = cowboy_router:compile([ShortLink]),
    DispathArg = #{env => #{dispatch => Dispath}},
    {ok,_} = cowboy:start_clear(http, [{port, 8080}], DispathArg),
    bitly_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
