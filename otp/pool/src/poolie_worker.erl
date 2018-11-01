-module(poolie_worker).

-behaviour(gen_server).

%% API
-export([start/1, stop/0, start_link/1]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

start(Server) ->
  gen_server:start(?MODULE, Server, []).

start_link(Server) ->
  gen_server:start_link(?MODULE, Server, []).

stop() ->
  gen_server:call(self(), stop).

init(Server) ->
  {ok, Server}.

handle_call(stop, _From, State) ->
  {stop, normal, stopped, State};

handle_call(_Request, _From, State) ->
  {reply, ok, State}.

handle_cast({work, MFA = {M, F, A}}, Server) ->
  Result = erlang:apply(M, F, A),
  gen_server:cast(Server, {result, {self(), MFA, Result}}),
  {noreply, Server};

handle_cast({work, FA = {F, A}}, Server) ->
  Result = erlang:apply(F, A),
  gen_server:cast(Server, {result, {self(), FA, Result}}),
  {noreply, Server};

handle_cast(_Msg, State) ->
  {noreply, State}.

handle_info(_Info, State) ->
  {noreply, State}.

terminate(_Reason, _State) ->
  ok.

code_change(_OldVsn, State, _Extra) ->
  {ok, State}.
