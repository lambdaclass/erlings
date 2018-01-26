-module(shortener_shortener_test).
-include_lib("eunit/include/eunit.hrl").

-compile(export_all).
-compile(nowarn_export_all).

idempotence_test() -> 
    shortener_shortener:init(),
    LongUrl = <<"long_url">>,
    {_, ShortUrl} = shortener_shortener:short(LongUrl),
    LongUrl = shortener_shortener:get(ShortUrl).
    
