-module(merge_map).

-export([merge/2]).

merge(Map1, Map2) ->
    maps:fold(fun(Key, V1, Map3) ->
                      case maps:is_key(Key, Map3) of
                          false -> maps:put(Key, V1, Map3);
                          true  ->
                              V2 = maps:get(Key, Map2),
                              maps:put(Key, V2, Map3)
                      end
              end,
              Map1, Map2).
