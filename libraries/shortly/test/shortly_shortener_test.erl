-module(shortly_shortener_test).

-include_lib("eunit/include/eunit.hrl").

idempotence_test() ->
    shortly_shortener:init(),
    LongUrl = <<"long_url">>,
    {_, ShortUrl} = shortly_shortener:short(LongUrl),
    LongUrl = shortly_shortener:get(ShortUrl).
