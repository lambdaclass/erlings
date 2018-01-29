-module(ring).
-export([main/1]).

node_setup() -> node_setup(#{}).
node_setup(State) ->
    receive
        {notify_time, Pid, MessageCount} ->
            start_root_node(State#{pid => Pid, m => MessageCount});
        {next_node, NextNode} ->
            node_setup(State#{next_node => NextNode});
        {send_message} ->
            loop_normal_node(State)
    end.

start_root_node(State = #{next_node := NextNode}) ->
    Now = erlang:timestamp(),
    NextNode ! {send_message},
    loop_root_node(State#{starting_time => Now}).

loop_root_node(#{starting_time := StartingTime,
                 pid := NotificationPid, m := 0}) ->
    Now = erlang:timestamp(),
    TimeDiffMs = timer:now_diff(Now, StartingTime),
    NotificationPid ! {time, TimeDiffMs};

loop_root_node(State = #{next_node := NextNode, m := MessageCount}) ->
    NextNode ! {send_message},
    receive
        {send_message} -> loop_root_node(State#{m => MessageCount - 1})
    end.

loop_normal_node(State = #{next_node := NextNode}) ->
    NextNode ! {send_message},
    receive
        {send_message} ->            
            loop_normal_node(State)
    end.

% N processes, M messages
main([NArg,MArg]) ->
    N = arg_to_number(NArg),
    M = arg_to_number(MArg),
    [Root | Rest] = [spawn_link(fun () -> node_setup() end)
                     || _Time <- lists:seq(1, N)],
    [Pid1 ! {next_node, Pid2}
     || {Pid1, Pid2} <- lists:zip([Root | Rest], Rest ++ [Root])],
    Root ! {notify_time, self(), M},
    receive
        {time, Time} -> Time
    end,
    io:format("Processes:~p, Messages:~p in ~pms~n", [N, M, Time]).

arg_to_number(Arg) ->
    Str = atom_to_list(Arg),
    {Int, _} =string:to_integer(Str),
    Int.
