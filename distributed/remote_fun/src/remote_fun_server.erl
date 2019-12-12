-module(remote_fun_server).

-export([function_server/0]).

function_server() ->
    register(function_server, self()),
    receive
        {be, Function} -> Function()
    end.
