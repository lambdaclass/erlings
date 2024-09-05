-module(shortly_syn).

-behaviour(shortly_notification_algorithm).

-export([init/0,
         subscribe/1,
         unsubscribe/1,
         notify/1]).

-define(SYN_NAME, syn_ws_connections).

init() ->
    ok = syn:add_node_to_scopes([?SYN_NAME]).

subscribe(Pid) ->
    syn:join(?SYN_NAME, "shortly-gruop", Pid).

unsubscribe(Pid) ->
    syn:leave(?SYN_NAME, "shortly-group", Pid).

notify(Msg) ->
    syn:publish(?SYN_NAME, "shortly-group", Msg).
