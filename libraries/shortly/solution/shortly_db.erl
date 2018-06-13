-module(shortly_db).

-export([store_url/1,
         save_url/2]).

-record(shortly_urls, {hash, url}).

store_url(ShortUrl) ->
  Result = mnesia:activity(transaction, fun() ->
      mnesia:read(shortly_urls, ShortUrl)
    end),
  case Result of
    [] ->
      [];
    [#shortly_urls{hash=ShortUrl, url=LongUrl}] ->
      [{ShortUrl, LongUrl}]
  end.

save_url(ShortUrl, LongUrl) ->
  mnesia:activity(transaction, fun() ->
      mnesia:write(#shortly_urls{hash=ShortUrl, url=LongUrl})
    end).
