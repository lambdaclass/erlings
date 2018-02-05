-module(consumer).

-export([consume/1]).

consume(Data) ->
  Atom = list_to_atom(binary_to_list(Data)),
  io:format("Processing ~p~n",[Atom]),
  timer:sleep(2000000),
  ok.
