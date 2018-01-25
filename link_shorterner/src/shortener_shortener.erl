-module(shortener_shortener).

-export([init/0,
         short/1,
         get/1]).

init() -> ensure_ets().

short(LongUrl) ->
    ShortUrl = shortening_algorithm(LongUrl),
    EntryType = store_url(ets_name(), LongUrl, ShortUrl),
    {EntryType, ShortUrl}.

get(ShortUrl) ->
    search_long_url(ets_name(), ShortUrl).

%% Internal functions

ets_name() -> 'shotener_ets'.

ensure_ets() ->
    EtsName = ets_name(),
    case ets:info(ets_name()) of
        undefined -> ets:new(EtsName, [set, public, named_table]);
        _         -> ok
    end.

shortening_algorithm(Url) ->
    Hash = crypto:hash(md4, Url),
    Base64 = base64:encode_to_string(Hash),
    Sub = string:substr(Base64, 1, 5),
    WithoutSlashes = re:replace(Sub, "/", "_", [global, {return, list}]),
    WithoutSlashes.

store_url(Ets, LongUrl, ShortUrl) ->
    case ets:lookup(Ets, ShortUrl) of
        [] ->
            ets:insert(Ets, {ShortUrl, LongUrl}),
            new;
        [{ShortUrl, LongUrl}] ->
            old
    end.

search_long_url(Ets, ShortUrl) ->
    case ets:lookup(Ets, ShortUrl) of
        [] -> not_found;
        [{ShortUrl, LongUrlEntry}] -> LongUrlEntry
    end.
