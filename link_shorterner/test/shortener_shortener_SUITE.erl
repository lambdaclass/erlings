-module(shortener_shortener_SUITE).

-include_lib("common_test/include/ct.hrl").

-export([all/0, init_per_testcase/2]).
-export([algorithm_idempotence/1]).

all() ->
    [algorithm_idempotence].

init_per_testcase(_,Config) ->
    shortener_shortener:init(),
    Config.

algorithm_idempotence(_) ->
    LongUrl = base64:encode(crypto:strong_rand_bytes(10)),
    {new, ShortUrl} = shortener_shortener:short(LongUrl),
    lists:foreach(fun(_) ->
                          {old, ShortUrl} = shortener_shortener:short(LongUrl)
                  end,lists:seq(1, 15)).
