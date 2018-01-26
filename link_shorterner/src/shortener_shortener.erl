-module(shortener_shortener).

-export([init/0,
         short/1,
         get/1,
         subscribe/1,
         unsubscribe/1]).

init() -> 
    ets:new(ets_name(), [set, public, named_table]),
    pg2:create(subs_name()).

short(LongUrl) ->
    ShortUrl = shortening_algorithm(LongUrl),
    EntryType = store_url(ets_name(), LongUrl, ShortUrl),
    notify_subscribers(EntryType, LongUrl, ShortUrl),
    {EntryType, ShortUrl}.

get(ShortUrl) ->
     search_long_url(ets_name(), ShortUrl).

subscribe(Pid) ->
    pg2:join(subs_name(), Pid).

unsubscribe(Pid) ->
    pg2:leave(subs_name(), Pid).

%% Internal functions

ets_name() -> shortener_ets.
subs_name() -> shortener_shortener_subs.

shortening_algorithm(Url) ->
    Hash = crypto:hash(md4, Url),
    Base64 = base64:encode(Hash),
    Sub = binary:part(Base64,1,5),
    WithoutSlashes = re:replace(Sub, "/", "_", [global, {return, list}]),
    list_to_binary(WithoutSlashes).

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
    Subs = pg2:get_members(subs_name()),
    lists:foreach(fun(Subscriber) ->
                          send_link_notification(Subscriber, LongUrl, ShortUrl)
                  end, Subs).
