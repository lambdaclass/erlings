-module(producer).

-export([produce/1]).

produce(ConsumerNode) ->
  produce(ConsumerNode, 1).

produce(ConsumerNode, N) when N < 1000000 ->
  RandomMsg = base64:encode(crypto:strong_rand_bytes(20)),
  rpc:async_call(ConsumerNode, consumer, consume, [RandomMsg]),
  io:format("~p messages sent ~n", [N]),
  produce(ConsumerNode, N+1).
