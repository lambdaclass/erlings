-module(shortly_shortener).

-export([init/0,
         short/1,
         get/1,
         subscribe/1,
         unsubscribe/1]).

init() ->
    notify_init().

short(LongUrl) ->
    ShortUrl = shortening_algorithm(LongUrl),
    EntryType = store_url(LongUrl, ShortUrl),
    notify_subscribers(EntryType, LongUrl, ShortUrl),
    {EntryType, ShortUrl}.

get(ShortUrl) ->
     search_long_url(ShortUrl).

subscribe(Pid) -> notify_subscribe(Pid).

unsubscribe(Pid) -> notify_unsubscribe(Pid).

%% Internal functions

shortening_algorithm(Url) ->
    Hash = crypto:hash(md4, Url),
    Base64 = base64:encode(Hash),
    Sub = binary:part(Base64,1,5),
    WithoutSlashes = re:replace(Sub, "/", "_", [global, {return, list}]),
    list_to_binary(WithoutSlashes).

store_url(LongUrl, ShortUrl) ->
    case shortly_db:store_url(ShortUrl) of
        [] ->
            shortly_db:save_url(ShortUrl, LongUrl),
            new;
        [{ShortUrl, LongUrl}] ->
            old
    end.

search_long_url(ShortUrl) ->
    case shortly_db:store_url(ShortUrl) of
        [] -> not_found;
        [{ShortUrl, LongUrlEntry}] -> LongUrlEntry
    end.

notify_technique_call(F,A) -> apply(shortly_syn,F,A).
notify_init() -> notify_technique_call(init,[]).
notify_subscribe(Pid) -> notify_technique_call(subscribe,[Pid]).
notify_unsubscribe(Pid) -> notify_technique_call(unsubscribe,[Pid]).
notify_notify(Msg) -> notify_technique_call(notify,[Msg]).

notify_subscribers(old,_,_) -> nothing;
notify_subscribers(new, LongUrl, ShortUrl) ->
    notify_notify(#{long_url => LongUrl, short_url => ShortUrl}).
