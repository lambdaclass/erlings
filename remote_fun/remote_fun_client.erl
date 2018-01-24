-module(remote_fun_client).

-export([function_client/1]).

function_client(RemoteNode) ->
    FunctionServerPid = {function_server, RemoteNode},
    FunctionServerPid ! {be, fun multiply_loop/0},
    FunctionServerPid ! {self(), {3, 9}},
    receive
        {product_result, _Result = 27} -> ok
    end,
    FunctionServerPid ! kill,
    io:format("Ok!~n").

multiply_loop() ->
    receive
        {From, {Factor1, Factor2}} ->
            Result = Factor1 * Factor2,
            From ! {product_result, Result},
            multiply_loop();
        kill -> kill
    end.
