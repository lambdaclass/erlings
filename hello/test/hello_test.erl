-module(hello_test).

-include_lib("eunit/include/eunit.hrl").

hello_world_test() ->
  <<"hello world">> = hello:hello().
