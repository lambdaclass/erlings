-module(regex).

-export([run/2]).

run(String, [$^ | Rs]) -> run(String, Rs);
run(String, Regex) ->
  match(String, Regex).

match_one(A, A) -> true;
match_one(_, $.) -> true;
match_one(_, _) -> false.

match_multiple_or_none([], _) -> [];
match_multiple_or_none([A|As] = Ss, B) ->
  case match_one(A, B) of
    true -> match_multiple_or_none(As, B);
    false -> Ss
  end.

match_multiple_at_least_one([],_ ) -> {false, []};
match_multiple_at_least_one([A|As] = Ss, B) ->
  case match_one(A,B) of
    true -> {true, match_multiple_or_none(As, B)};
    false -> {false, Ss}
  end.

match(Ss, [R, $? | Rs]) ->
  case match_multiple_at_least_one(Ss, R) of
    {true, Ss2} -> match(Ss2, Rs);
    {false, _} -> false
  end;
match(Ss, [R, $* | Rs]) ->
  io:format("~p~n", [Ss]),
  match(match_multiple_or_none(Ss, R), Rs);
match([], [$$]) -> true;
match([], []) -> true;
match([], _) -> false;
match(_, []) -> false;
match([S | Ss], [R | Rs]) ->
  case match_one(S, R) of
    true -> match(Ss, Rs);
    false -> false
  end.
