-module(producer).

-export([produce/1]).

produce(RemoteNode) ->
  produce(RemoteNode, 1).

produce(RemoteNode, N) when N < 1000000 ->
  RandomMsg = base64:encode(crypto:strong_rand_bytes(20)),
  {consumer, RemoteNode} ! {msg, RandomMsg},
  io:format("~p messages sent ~n", [N]),
  timer:sleep(25),
  produce(RemoteNode, N+1).
