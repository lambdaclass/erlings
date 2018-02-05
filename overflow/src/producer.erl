-module(producer).

-export([produce/0]).

produce() ->
  Pid = consumer:start(),
  produce(Pid, 10000000).

produce(Pid, N) when N > 0 ->
  RandomMsg = base64:encode(crypto:strong_rand_bytes(20)),
  consumer:send_message(Pid, RandomMsg),
  timer:sleep(25),
  produce(Pid, N-1).
