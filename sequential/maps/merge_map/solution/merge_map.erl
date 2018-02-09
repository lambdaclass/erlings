-module(merge_map).

-export([merge/2]).

merge(Map1, Map2) ->
    maps:fold(fun maps:put/3, Map1, Map2).
