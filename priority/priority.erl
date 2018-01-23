-module(priority).

-export([start/0,
         send_vip/2,
         send_normal/2]).

-include_lib("eunit/include/eunit.hrl").

start() ->
    spawn_link(fun priority_loop/0).

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
                {vip, Msg} ->
                    process_vip_msg(Msg),
                    priority_loop();
                {normal, Msg} ->
                    io:format("normal msg : ~p~n", [Msg]),
                    priority_loop();
                {server, {Pid, die}} ->
                    Pid ! die,
                    die
            end
    end.

send_server(Pid,Msg) ->
    Pid ! {server,{self(),Msg}}.

send_die_and_wait(Pid) ->
    send_server(Pid,die),
    receive 
        die -> ok
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
    send_die_and_wait(Pid).
