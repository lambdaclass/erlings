-module(filter_numbers).

-export([filter_in/3,
         filter_out/3,
         filter_in_values/3]).

filter_in(From, To, N) ->
  [X || X <- lists:seq(From, To), X rem N =:= 0].

filter_out(From, To, N) ->
  [X || X <- lists:seq(From, To), X rem N =/= 0].

filter_in_values(From, To, {Min, Max}) ->
  [X || X <- lists:seq(From, To), X >= Min, X =< Max].
