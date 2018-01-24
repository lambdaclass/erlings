-module(remote_fun_client).

-export([function_client/0]).

-include("fun_common.hrl").

function_client() ->
    ?CONNECT_TO_SERVER,
    send_function(fun multiply_loop/0),
    ?SERVER_PID ! {self(), {3, 9}},
    receive
        {product_result, Result} ->
            27 = Result
    end,
    ?SERVER_PID ! kill,
    io:format("Ok!~n").

%% because it can't be garanteed the order the nodes will be started,
%% a confirmation is needed even for this simple exercise
send_function(Function) ->
    ?SERVER_PID ! {be, self(), Function},
    receive
        {function_server, ok} -> 
            ok
    after 1000 ->
            send_function(Function)
    end.

multiply_loop() ->
    receive
        {From, {Factor1, Factor2}} ->
            Result = Factor1 * Factor2,
            From ! {product_result, Result},
            multiply_loop();
        kill -> kill
    end.
