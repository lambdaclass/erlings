
-module(run_length_encoding_test).

-include_lib("eunit/include/eunit.hrl").

-compile(export_all).
-compile(nowarn_export_all).

run_length_encoding_test() ->
    List = [a, a, a, a, b, c, c, a, a, d, e, e, e, e],
    Res = [[4, a], [1, b], [2, c], [2, a], [1, d], [4, e]], 
    Res = run_length_encoding:run_length_encode(List).
