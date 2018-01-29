-module(shortly_notification_pg2).

-behaviour(shortly_notification_algorithm).

-export([init/0,
         subscribe/1,
         unsubscribe/1,
         notify/1]).

-define (PG2_NAME, shortly_notification_pg2_name).

init() ->
    pg2:create(?PG2_NAME).

subscribe(Pid) ->
    pg2:join(?PG2_NAME, Pid).

unsubscribe(Pid) ->
    pg2:leave(?PG2_NAME, Pid).

notify(Msg) ->
    Subs = pg2:get_members(?PG2_NAME),
    lists:foreach(
     fun(Pid) ->
             Pid ! Msg
     end, Subs).
