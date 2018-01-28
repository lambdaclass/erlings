-module(shortly_notification_ets).

-behaviour(shortly_notification_algorithm).

-export([init/0,
         subscribe/1,
         unsubscribe/1,
         notify/1]).

-define(ETS_NAME, shortly_notification_ets_table).

init() ->
    ets:new(?ETS_NAME, [set, public, named_table]).

subscribe(Pid) ->
    ets:insert_new(?ETS_NAME, {Pid}).

unsubscribe(Pid) ->
    ets:delete(?ETS_NAME, Pid).

notify(Msg)->
    ets:foldl(
      fun({Pid}, _) ->
              Pid ! Msg
      end,ignored, ?ETS_NAME).
