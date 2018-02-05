-module(ring).
-export([main/1]).

node_loop(Parent) ->
  receive
    {msg, [FirstNode | OtherNodes]} ->
      FirstNode ! {msg, OtherNodes},
      case OtherNodes of
        [] -> Parent ! done;
        _  -> node_loop(Parent)
      end
  end.

% N processes, M messages
main([NArg, MArg]) ->
  N = arg_to_number(NArg),
  M = arg_to_number(MArg),
  [FirstNode | Nodes] = create_processes(N, M),
  BeforeFistMessage = os:timestamp(),
  FirstNode ! {msg, Nodes},
  receive
    done -> done
  end,
  AfterLastMessage = os:timestamp(),
  ElapsedTime = timer:now_diff(AfterLastMessage, BeforeFistMessage),
  io:format("Processes: ~p, Messages ~p in ~pms~n", [N, M, ElapsedTime]).

create_processes(N, M) ->
  Parent = self(),
  Processes = [spawn_link(fun () -> node_loop(Parent) end)
               || _ <- lists:seq(1, N)],
  lists:append(lists:duplicate(M, Processes)).

arg_to_number(Arg) ->
    Str = atom_to_list(Arg),
    {Int, _} =string:to_integer(Str),
    Int.
