-module(priority_test).

-include_lib("eunit/include/eunit.hrl").


sort_fun({vip, _}, {vip, _}) ->
  true;
sort_fun({normal, _}, {normal, _}) ->
  true;
sort_fun({vip, _}, {normal, _}) ->
  true;
sort_fun({normal, _}, {vip, _}) ->
  false.

priority_test() ->
  Msgs = [{normal, 1},
          {normal, 2},
          {vip, 3},
          {vip, 4},
          {normal, 5},
          {normal, 6},
          {normal, 7},
          {vip, 8},
          {vip, 9}],
  Msgs_ordered = lists:sort(fun sort_fun/2, Msgs),
  Pid = priority:start(),
  lists:foreach(fun(Msg) -> Pid ! Msg end, Msgs),
  ?assertEqual(Msgs_ordered, priority:get_messages(Pid)).
