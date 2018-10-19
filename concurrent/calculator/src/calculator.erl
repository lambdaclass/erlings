-module(calculator).
-export([start_calculator/0,
         calculator_server/0,
         turn_off/1,
         add/3,
         subtract/3,
         multiply/3,
         divide/3]).


start_calculator() ->
  spawn(fun calculator_server/0).

calculator_server() ->
    receive
        {From, {add, N1, N2}} -> From ! {self(), {N1 + N2}}, calculator_server();
        {From, {subtract, N1, N2}} -> From ! {self(), {N1 - N2}}, calculator_server();
        {From, {multiply, N1, N2}} -> From ! {self(), {N1 * N2}}, calculator_server();
        {From, {divide, N1, N2}} -> From ! {self(), {N1 / N2}}, calculator_server();
        {From, {turn_off}} -> From ! {self(), {off}}
    end.

turn_off(Pid) ->
    Pid ! {self(), {turn_off}},
    receive
        {Pid, Message} -> Message
    end.

add(Cal, N1, N2) -> calculate(Cal, add, N1, N2).

subtract(Cal, N1, N2) -> calculate(Cal, subtract, N1, N2).

multiply(Cal, N1, N2) -> calculate(Cal, multiply, N1, N2).

divide(Cal, N1, N2) -> calculate(Cal, divide, N1, N2).

calculate(Cal, Operation, N1, N2) ->
    Cal ! {self(), {Operation, N1, N2}},
    receive
        {Cal, {Result}} -> Result
    end.
