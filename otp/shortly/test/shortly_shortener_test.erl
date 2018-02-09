-module(shortly_shortener_test).
-include_lib("eunit/include/eunit.hrl").

-compile(export_all).
-compile(nowarn_export_all).

idempotence_test() -> 
    shortly_shortener:init(),
    LongUrl = <<"long_url">>,
    {_, ShortUrl} = shortly_shortener:short(LongUrl),
    LongUrl = shortly_shortener:get(ShortUrl).
    
