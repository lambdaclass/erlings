-module(shortly_notification_algorithm).

-export([behaviour_info/1]).

behaviour_info(callbacks) ->
    [{init,0},
     {subscribe, 1},
     {unsubscribe, 1},
     {notify, 1}].
