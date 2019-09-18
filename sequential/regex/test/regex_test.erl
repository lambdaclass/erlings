-module(regex_test).
-include_lib("eunit/include/eunit.hrl").

matches_characters_test() -> 
    ?assert(regex:match("a", "a")).

matches_numbers_test() -> 
    ?assert(regex:match("49", "49")).

matches_question_mark_test() ->
    ?assert(regex:match("Hi", "h?")).

matches_multiple_chars_test() ->
    ?assert(regex:match("aaaaaaaaa", "a*")).

matches_empty_string_test() ->
    ?assert(regex:match(" ", "a*")).

matches_any_character_test() ->
    ?assert(regex:match("asdf as 42", ".")).
