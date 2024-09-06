-module(shortly_notification_pg2).

-behaviour(shortly_notification_algorithm).

-export([init/0,
         subscribe/1,
         unsubscribe/1,
         notify/1]).

-define (PG_NAME, shortly_notification_pg2_name).

init() ->
    pg:create(?PG_NAME).

subscribe(Pid) ->
    pg:join(?PG_NAME, Pid).

unsubscribe(Pid) ->
    pg:leave(?PG_NAME, Pid).

notify(Msg) ->
    Subs = pg:get_members(?PG_NAME),
    lists:foreach(
     fun(Pid) ->
             Pid ! Msg
     end, Subs).
