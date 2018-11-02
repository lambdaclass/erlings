-module(poolie_worker).

-behaviour(gen_server).

%% API
-export([start/0]).
-export([init/1, handle_call/3, handle_cast/2]).

-define(SERVER, poolie_server).

%% API

start() ->
  gen_server:start(?MODULE, [], []).

%% gen_server callbacks

init(_Args) ->
  {ok, []}.

handle____({work, MFA = {M, F, A}}, State) ->
  put_your_solution_here;

handle____({work, FA = {F, A}}, State) ->
  put_your_solution_here.

handle_cast(_Msg, State) ->
  {noreply, State}.
handle_call(_Request, _From, State) ->
  {reply, ok, State}.
