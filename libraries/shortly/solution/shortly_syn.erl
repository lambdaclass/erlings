-module(shortly_syn).

-behaviour(shortly_notification_algorithm).

-export([init/0,
         subscribe/1,
         unsubscribe/1,
         notify/1]).

-define(SYN_NAME, syn_ws_connections).

init() ->
    syn:start().

subscribe(Pid) ->
    syn:join(?SYN_NAME, Pid).

unsubscribe(Pid) ->
    pg2:leave(?SYN_NAME, Pid).

notify(Msg) ->
    syn:publish(?SYN_NAME, Msg).
