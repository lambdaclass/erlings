-module(remote_fun_server).

-export([start_function_server/0]).

-record(server_state, {function = undefined, process=undefined}).

start_function_server() -> spawn_link(fun init_server/0).

%% internal functions

init_server() ->
    net_kernet:connect_node(function_clei@localhost)
    process_flag(trap_exit, true),
    loop_server(#server_state{}).

loop_server(State = #server_state{function = Function, process=Process}) ->
    receive 
        {start_function, NewFunction} ->
            loop_server(start_function_process(NewFunction,State));
        stop_function -> 
            loop_server(stop_function(State));
        {call_function, From, Args} ->
            call_process_function(From,Args,Process);
        {'EXIT', Process, function_quits} ->
            loop_server(without_process_nor_function(State));
        {'EXIT', Process, _AnnormalReason} ->
            loop_server(start_function_process(Function, without_process(State)))
    end.

call_process_function(_,_,undefined) -> undefined;
call_process_function(From,Args,ChildPid) -> 
    ChildPid ! {exec,self(),Args},
    receive 
        {fun_ret,RetValue} ->
            From ! {function,{ret_value, RetValue}}
    after 5000 ->
            From ! {function,error}
    end.

without_process(State) -> State#server_state{process=undefined}.
without_process_nor_function(State) -> without_process(State#server_state{function=undefined}).

start_function_process(NewFunction, State = #server_state{process = undefined}) ->
    Pid = spawn_link(fun () -> function_child_init(NewFunction) end),
    State#server_state{function=NewFunction,process=Pid};

start_function_process(NewFunction, State = #server_state{process = _FunProcess}) ->
    ChildRemoved = stop_function(State),
    start_function_process(NewFunction, ChildRemoved).

stop_function(State = #server_state{process=FunProcess}) ->
    FunProcess ! die,
    receive
        {'EXIT', FunProcess, _} -> 
            ok
    after 5000 ->
            FunProcess ! kill
    end,
    without_process_nor_function(State).

function_child_init(Function) ->
    function_child_loop(Function).

function_child_loop(Function) ->
    receive
        {exec,From,Args} -> 
            FunRet = Function(Args),
            From ! {fun_ret, FunRet},
            function_child_loop(Function);
        die ->
            exit(function_quits)
    end.
