-module(priority).

-export([start/0,
         get_messages/1,
         priority_loop/1]).

start() ->
  spawn(?MODULE, priority_loop, [[]]).

get_messages(Pid) ->
    Pid ! {self(), {get}},
    receive
        {Pid, {State}} -> State
    end.

priority_loop(State) ->
    receive
        {vip, Msg} -> priority_loop([{vip, Msg} | State])
    after 0 ->
        receive
            {From, {get}} -> From ! {self(), {lists:reverse(State)}};
            {Priority, Msg} -> priority_loop([{Priority, Msg} | State])
        end
    end.
