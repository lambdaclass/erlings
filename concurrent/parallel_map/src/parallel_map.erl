-module(parallel_map).
-export([pmap/2, mapper/1]).

mapper(Value) -> 
    receive
        {From, {Fun}} -> From ! {self(), {Fun(Value)}}
    end.

pmap(Fun, List) ->
    Workers = [spawn_link(?MODULE, mapper, [X]) || X <- List],
    lists:foreach(fun (Worker) -> Worker ! {self(), {Fun}} end, Workers), 
    lists:map(fun (Worker) -> receive {Worker, {Mapped}} -> Mapped end end, Workers).
