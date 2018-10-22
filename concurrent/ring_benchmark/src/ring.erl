-module(ring).
-export([ring/2, worker/1]).

%% N processes, M messages
ring(N, M) ->
    io:format("Starting ~p processes~n", [N]),
    Node = lists:foldl(fun create_process/2, self(), lists:seq(1, N)),
    Msg = <<"hola">>,
    do_rounds(M, Node, Msg).

create_process(_X, Next) ->
    spawn_link(?MODULE, worker, [Next]).

worker(Next) ->
    receive
        Msg -> Next ! Msg,
        worker(Next)
    end.

do_rounds(1, Node, Msg) ->
    Node ! Msg,
    receive
        Msg -> io:format("Done!")
    end;
do_rounds(Rounds, Node, Msg) ->
    Node ! Msg,
    receive
        Msg -> do_rounds(Rounds - 1, Node, Msg)
    end.
