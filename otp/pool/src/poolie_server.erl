-module(poolie_server).

-behaviour(gen_server).

-export([start_link/1, run/3, run/2]).
-export([init/1, handle_call/3, handle_cast/2]).

%% API

run(M, F, A) ->
  put_your_solution_here.

run(F, A) ->
  put_your_solution_here.

start_link(Args) ->
  put_your_solution_here.

%% gen_server callbacks

init(Args) ->
  put_your_solution_here.

handle_call({work, MFA}, _From, State) ->
  put_your_solution_here;

handle_call(stop, _From, State) ->
  {stop, normal, stopped, State};

handle_call(_Request, _From, State) ->
  {reply, ok, State}.

handle_cast(_Msg, State) ->
  {noreply, State}.
