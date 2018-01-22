-module(priority).

-export([start/0,
         send_vip/2,
         send_normal/2]).

-include_lib("eunit/include/eunit.hrl").

start() ->
    spawn(fun priority_loop/0).

send_vip(Pid, Msg) ->
    Pid ! {vip, Msg}.

send_normal(Pid, Msg) ->
    Pid ! {normal, Msg}.

process_vip_msg(Msg) ->
    io:format("Processing importante msg: ~p~n", [Msg]),
    timer:sleep(500). % only for being able to produce faster than cusume (testing...)

%%% internal functions

priority_loop() ->
    receive
        {vip, Msg} ->
            process_vip_msg(Msg),
            priority_loop()
    after 0 ->
            receive 
                {normal, Msg} ->
                    io:format("normal msg : ~p~n", [Msg]),
                    priority_loop();
                {vip, Msg} ->
                    process_vip_msg(Msg),
                    priority_loop()
            end
    end.

send_test() ->
    Pid = start(),
    send_normal(Pid, "NORMAL0"),
    send_normal(Pid, "NORMAL1"),
    send_vip(Pid,"VIP2"),
    send_vip(Pid,"VIP3"),
    send_normal(Pid,"NORMAL4"),
    send_normal(Pid,"NORMAL5"),
    send_normal(Pid,"NORMAL6"),
    send_vip(Pid,"VIP7"),
    send_vip(Pid,"VIP8"),
    timer:sleep(5000).
