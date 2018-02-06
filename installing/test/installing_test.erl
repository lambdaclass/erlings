-module(installing_test).

-include_lib("eunit/include/eunit.hrl").

-compile(export_all).
-compile(nowarn_export_all).

installing_test() ->
  'i can not wait for more code' = 
    installing:installed().
