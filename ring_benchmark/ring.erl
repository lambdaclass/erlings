-module(ring).
-export([main/1]).

node_loop() ->
  receive
    {msg, []} -> ok;
    {msg, [FirstNode | OtherNodes]} ->
      FirstNode ! {msg, OtherNodes},
      node_loop()
  end.
    

% N processes, M messages
main([NArg,MArg]) ->
  N = arg_to_number(NArg),
  M = arg_to_number(MArg),
  [FirstNode | Nodes] = create_processes(N, M),
  BeforeFistMessage = os:timestamp(),
  FirstNode ! {msg, Nodes},
  receive
    {msg, _} -> ok
  end,
  AfterLastMessage = os:timestamp(),
  ElapsedTime = timer:now_diff(AfterLastMessage, BeforeFistMessage),
  io:format("Processes: ~p, Messages ~p in ~pms~n", [N, M, ElapsedTime]).

create_processes(N, M) ->
  Processes = [spawn_link(fun () -> node_loop() end)
               || _ <- lists:seq(1, N)],
  ProcessList =
    lists:foldl(fun(X,Acc) ->
                    Acc ++ X
                end,[],lists:duplicate(M, Processes)),
  CompleteLoop = ProcessList ++ [self()],
  lists:foldr(fun(Pid,_) ->
                  Pid ! {process_list, CompleteLoop }
              end,none,ProcessList),
  CompleteLoop.

arg_to_number(Arg) ->
    Str = atom_to_list(Arg),
    {Int, _} =string:to_integer(Str),
    Int.
