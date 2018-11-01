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

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

%% Child :: #{id => Id, start => {M, F, A}}
%% Optional keys are restart, shutdown, type, modules.
%% Before OTP 18 tuples must be used to specify a child. e.g.
%% Child :: {Id,StartFunc,Restart,Shutdown,Type,Modules}
init([]) ->
    Server = #{id => poolie_server,
      start => {poolie_server, start_link, [10, ?SERVER]}, 
      restart => permanent, shutdown => 10000, type => worker, modules => [poolie_server]},
    {ok, {{one_for_all, 5, 150}, [Server]}}.

%%====================================================================
%% Internal functions
%%====================================================================

