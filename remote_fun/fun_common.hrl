-define(SERVER, function_server@localhost).
-define(CLIENT, function_client@localhost).
-define(SERVER_PID, {?SERVER, ?SERVER}).
-define(CONNECT_TO_CLIENT, connect_to_node(?CLIENT)).
-define(CONNECT_TO_SERVER, connect_to_node(?SERVER)).

connect_to_node(Node, Attemp) when Attemp =< 5 ->
    case net_kernel:connect_node(Node) of
        true -> true;
        _ ->
            SleepTime = (Attemp+1)*500,
            io:format("Connection to ~p failed, retrying in ~pms~n",[Node,SleepTime]),
            timer:sleep(SleepTime),
            connect_to_node(Node, Attemp+1)
    end;

connect_to_node(Node,Attem) when Attem > 5 ->
    exit({unable_to_connect, Node}).

connect_to_node(Node) -> connect_to_node(Node, 0).




    
