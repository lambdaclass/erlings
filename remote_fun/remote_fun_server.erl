-module(remote_fun_server).

-export([function_server/0]).

-include("fun_common.hrl").

function_server() ->
    ?CONNECT_TO_CLIENT,
    register(?SERVER, self()),
    receive
        {be, From, Function} ->
            From ! {function_server, ok},
            Function()
    end.
