-module(calculator).
-export([start_calculator/0,
         calculator_server/0,
         add/3,
         substract/3,
         multiply/3,
         divide/3,
         turn_off/1]).

start_calculator() ->
  spawn(calculator, calculator_server, []).

send_operation(Pid, Operation, Numbers) ->
  Pid ! {self(), Operation, Numbers},
  receive
    Result ->
      Result
  end.

add(Pid, X, Y) ->
  send_operation(Pid, add, {X, Y}).

substract(Pid, X, Y) ->
  send_operation(Pid, substract, {X, Y}).

multiply(Pid, X, Y) ->
  send_operation(Pid, multiply, {X, Y}).

divide(Pid, X, Y) ->
  send_operation(Pid, divide, {X, Y}).

calculator_server() ->
  receive
    {From, add, {X, Y}} ->
      From ! X + Y;
    {From, substract, {X, Y}} ->
      From ! X - Y;
    {From, multiply, {X, Y}} ->
      From ! X * Y;
    {From, divide, {X, Y}} ->
      From ! X / Y;
    off ->
      exit(shutdown)
  end,
  calculator_server().

turn_off(Pid) ->
  Pid ! off.
