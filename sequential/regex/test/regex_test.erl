-module(regex_test).
-include_lib("eunit/include/eunit.hrl").

regex_test() ->
  ?assertEqual(true,  regex:run("hi", "hi")),
  ?assertEqual(false, regex:run("hi", "bye")),
  ?assertEqual(true,  regex:run("sun", "s.n")),
  ?assertEqual(true,  regex:run("son", "s.n")),
  ?assertEqual(false, regex:run("asd", "as")),
  ?assertEqual(true,  regex:run("heeelloooooo", "he*llo*")),
  ?assertEqual(true,  regex:run("hllo", "he*llo*")),
  ?assertEqual(false, regex:run("hll", "he+llo*")),
  ?assertEqual(true,  regex:run("hello", "^hello")),
  ?assertEqual(true,  regex:run("hello", "hello$")),
  ?assertEqual(true,  regex:run("yessss", "ye.?")),
  ?assertEqual(true,  regex:run("yeii", "ye.?")),
  ?assertEqual(false, regex:run("ye", "ye.?")).

