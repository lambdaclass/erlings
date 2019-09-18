%%%-------------------------------------------------------------------
%% @doc poolie top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(poolie_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
    supervisor:start_link(?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

%% Child :: #{id => Id, start => {M, F, A}}
%% Optional keys are restart, shutdown, type, modules.
%% Before OTP 18 tuples must be used to specify a child. e.g.
%% Child :: {Id,StartFunc,Restart,Shutdown,Type,Modules}
init([]) ->
  WorkerSup = worker_supervisor_spec,
  Server = pool_server_spec,
  {ok, {{supervisor_strategy}, [WorkerSup, Server]}}.

%%====================================================================
%% Internal functions
%%====================================================================

