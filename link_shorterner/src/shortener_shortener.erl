-module(shortener_shortener).

-export([init/0,
         short/1,
         get/1,
         subscribe/1]).

init() -> 
    ets:new(ets_name(), [set, public, named_table]),
    ets:new(subs_ets_name(), [set, public, named_table]).

short(LongUrl) ->
    ShortUrl = shortening_algorithm(LongUrl),
    EntryType = store_url(ets_name(), LongUrl, ShortUrl),
    notify_subscribers(EntryType,LongUrl,ShortUrl),
    {EntryType, ShortUrl}.

get(ShortUrl) ->
    search_long_url(ets_name(), ShortUrl).

subscribe(Pid) ->
    ets:insert(subs_ets_name(),{Pid}).

%% Internal functions

ets_name() -> 'shortener_ets'.
subs_ets_name() -> 'shortner_subs_ets'.

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

send_link_notification(Pid, LongUrl, ShortUrl) ->
    Pid ! #{long_url => LongUrl, short_url => ShortUrl}.

notify_subscribers(old,_,_) -> nothing;
notify_subscribers(new, LongUrl, ShortUrl) ->
    ets:foldl(fun({Subscriber},unused) ->
                      send_link_notification(Subscriber, LongUrl, ShortUrl)
              end, unused, subs_ets_name()).
