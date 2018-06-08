-module(priority).

-export([start/0,
         send_vip/2,
         send_normal/2,
         get_messages/1,
         priority_loop/1]).

start() ->
  spawn_link(priority, priority_loop, [[]]).

send_vip(Pid, Msg) ->
  Pid ! {vip, Msg}.

send_normal(Pid, Msg) ->
  Pid ! {normal, Msg}.

get_messages(Pid) ->
  Pid ! {server, {self(), current_msgs}},
  receive
    Msgs ->
      Msgs
  end.

priority_loop(State) ->
  receive
    {vip, Msg} ->
      priority_loop([{vip, Msg}] ++ State)
  after 0 ->
    receive
      {server, {From, current_msgs}} ->
        From ! lists:reverse(State);
      {Priority, Msg} ->
        priority_loop([{Priority, Msg}] ++ State)
    end
  end.
