-module(consumer).

-export([start/0,
         send_message/2]).

start() ->
  Opts = [{max_heap_size, 1024}, {message_queue_data, on_heap}],
  spawn_opt(fun() -> consumer_loop() end, Opts).

consumer_loop() ->
  receive
    {msg, Msg} ->
      io:format("Processing ~p~n",[Msg]),
      timer:sleep(100),
      consumer_loop()
  end.

send_message(Pid, Msg) ->
  Pid ! {msg, Msg}.
        
