-module(hello_test).

-include_lib("eunit/include/eunit.hrl").

-compile(export_all).
-compile(nowarn_export_all).

hello_world_test() ->
  <<"hello world">> = hello:hello().
