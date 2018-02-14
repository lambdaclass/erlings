-module(ring).
-export([main/2]).

node_loop(Parent) ->
  receive
    {msg, []} -> Parent ! done;
    {msg, [FirstNode | OtherNodes]} ->
      io:format("Node ~p forwarding to ~p~n", [self(), FirstNode]),
      FirstNode ! {msg, OtherNodes},
      node_loop(Parent)
  end.

% N processes, M messages
main(N, M) ->
  [FirstNode | Nodes] = create_processes(N, M),
  BeforeFistMessage = os:timestamp(),
  FirstNode ! {msg, Nodes},
  receive
    done -> io:format("done received ~n")
  end,
  AfterLastMessage = os:timestamp(),
  ElapsedTime = timer:now_diff(AfterLastMessage, BeforeFistMessage),
  io:format("Processes: ~p, Messages ~p in ~pms~n", [N, M, ElapsedTime]).

create_processes(N, M) ->
  Parent = self(),
  Processes = [spawn_link(fun () -> node_loop(Parent) end)
               || _ <- lists:seq(1, N)],
  lists:append(lists:duplicate(M, Processes)).
