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

handle_call(_Request, _From, State) ->
  {reply, ok, State}.

handle_cast({work, MFA = {M, F, A}}, State) ->
  Result = erlang:apply(M, F, A),
  gen_server:cast(?SERVER, {result, {self(), MFA, Result}}),
  {noreply, State};

handle_cast({work, FA = {F, A}}, State) ->
  Result = erlang:apply(F, A),
  gen_server:cast(?SERVER, {result, {self(), FA, Result}}),
  {noreply, State};

handle_cast(_Msg, State) ->
  {noreply, State}.
