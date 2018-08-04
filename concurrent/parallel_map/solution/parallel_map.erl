-module(parallel_map).
-export([pmap/2,
         apply/3]).

pmap(Fun, List) ->
  Pids = lists:map(fun(Elem) ->
      spawn(parallel_map, apply, [self(), Fun, Elem])
    end,
    List),
  lists:map(fun(Pid) ->
      receive
        {Pid, Result} ->
          Result
      end
    end,
    Pids).

apply(From, Fun, Elem) ->
  From ! {self(), Fun(Elem)}.
