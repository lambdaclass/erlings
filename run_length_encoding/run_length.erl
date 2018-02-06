-module(run_length).

-export([run_length_encode/1]).

-include_lib("eunit/include/eunit.hrl").

run_length_encode([[Count, H]|[]]) ->
    [[Count, H]];

run_length_encode([[Count, H1], H1|T]) ->
    run_length_encode([[Count + 1, H1]|T]);

run_length_encode([[Count, H1], H2|T]) ->
    [[Count, H1]|run_length_encode([[1, H2]|T])];

run_length_encode([H|T]) ->
    run_length_encode([[1, H]|T]);

run_length_encode([]) ->
    [].

run_length_encoding_test() ->
    List = [a,a,a,a,b,c,c,a,a,d,e,e,e,e],
    [[4,a],[1,b],[2,c],[2,a],[1,d],[4,e]] = run_length_encode(List).
    
