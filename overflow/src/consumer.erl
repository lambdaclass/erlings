-module(consumer).

-export([consume/0]).

consume() ->
  Opts = [{max_heap_size, 1024}, {message_queue_data, on_heap}],
  spawn_opt(fun() -> consumer_setup() end, Opts).

consumer_setup() ->
  register(consumer, self()),
  consumer_loop().

consumer_loop() ->
  receive
    {msg, Msg} ->
      io:format("Processing ~p~n",[Msg]),
      timer:sleep(100),
      consumer_loop()
  end.
        
