-module(ring_test).

-include_lib("eunit/include/eunit.hrl").

ring_test() ->
  ?assertMatch(#{msgs_sent := 4, procs_started := 2},
               run_ring(2, 2)),
  ?assertMatch(#{msgs_sent := 12, procs_started := 4},
               run_ring(4, 3)),
  ?assertMatch(#{msgs_sent := 380, procs_started := 19},
               run_ring(19, 20)).

run_ring(M, N) ->
  dbg_start_tracing(M, N),
  ring:main(M, N),
  Result = dbg_wait_for_result(M,N),
  dbg_stop_tracing(),
  Result.

dbg_start_tracing(M, N) ->
  dbg:stop_clear(),
  dbg:tracer(process, {fun dbg_fun_handler/2, dbg_init_state(M, N)}),
  dbg:p(new, [m,p]).

dbg_stop_tracing() -> dbg:stop_clear().

dbg_wait_for_result(M, N) ->
  WaitTime = M * N * 1000,
  receive
    DbgState -> DbgState
  after WaitTime ->
      #{}
  end.

dbg_init_state(M, N) ->
  #{m => M,
    n => N,
    ret_pid => self(),
    procs_started => 0,
    msgs_sent => 0,
    informed => false}.

dbg_fun_handler(Trace, State) ->
  TracedState = dbg_capture_trace(Trace, State),
  dbg_inform_if_necessary(TracedState).

dbg_capture_trace(Trace, State = #{procs_started := ProcsStarted,
                                   msgs_sent := MsgsSent}) ->
  case Trace of
    {_, _, spawned, _, _} -> State#{procs_started := ProcsStarted + 1};
    {_, _, send, _, _} -> State#{msgs_sent := MsgsSent + 1};
    _ -> State
  end.

dbg_inform_if_necessary(State = #{m := M, n := N, ret_pid := RetPid}) ->
  MN = M * N,
  case State of
    #{msgs_sent := MN, informed := false} ->
      RetPid ! State#{informed => true};
    _ ->
      State
  end.
