-module(remote_fun_client).

-export([start_function_client/0]).

start_function_client() ->
    

%% internal functions

add_function({A,B}) -> A + B.
multiply_function({A,B}) -> A * B.

