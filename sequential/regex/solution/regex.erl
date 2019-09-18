-module(regex).
-export([match/2]).

match([], _Regex) -> 
    false;
match(_String, []) -> 
    false;
match(String, [$^ | Regex]) -> 
    matching(String, Regex);
match(String, Regex) ->
    case matching(String, Regex) of
      true -> true;
      false -> match(tl(String), Regex)
    end.

matching(_String, []) -> 
    true;
matching([], [$$]) -> 
    true;
matching([], [_Char, $? | Regex]) ->
    matching([], Regex);
matching([], [_Char, $* | Regex]) ->
    matching([], Regex);
matching([], _Regex) -> 
    false;
matching(_String, [$$]) -> 
    false;
matching(String, [$., $* | RemRegex] = Regex) ->
    case matching(String, RemRegex) of
      true -> true;
      false -> matching(tl(String), Regex)
    end;
matching([Char | String], [Char, $? | Regex]) ->
    matching(String, Regex);
matching(String, [_OtherChar, $? | Regex]) ->
    matching(String, Regex);
matching([Char | String],
	 [Char, $* | _RemRegex] = Regex) ->
    matching(String, Regex);
matching(String, [_OtherChar, $* | Regex]) ->
    matching(String, Regex);
matching([_Char | String], [$. | Regex]) ->
    matching(String, Regex);
matching([Char | String], [Char | Regex]) ->
    matching(String, Regex);
matching([_Char | _String], [_OtherChar | _Regex]) ->
    false.
