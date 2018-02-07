-module(rmconsecutive_test).

-include_lib("eunit/include/eunit.hrl").

-compile(export_all).
-compile(nowarn_export_all).

rmconsecutive_test() ->
    List = [1, 1, 1, 2, 3, 4, 1, 1, 1, 3],
    [1,2,3,4,1,3] = rmconsecutive:rm(List).
