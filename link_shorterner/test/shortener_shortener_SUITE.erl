-module(shortener_shortener_SUITE).

-include_lib("common_test/include/ct.hrl").

-export([all/0,
         init_per_testcase/2,
         end_per_testcase/2]).
-export([test_notfound/1,
         test_created/1,
         test_ok/1,
         test_redirect/1]).

all() ->
    [test_notfound,
     test_created,
     test_ok,
     test_redirect].

init_per_testcase(_,Config) ->
    start_web_server(),
    Config.

end_per_testcase(_, Config) ->
    stop_web_server(),
    Config.

test_notfound(_) ->
    lists:foreach(
      fun(_) ->
              {404, _} = do_get_request(gen_random_url())
      end, lists:seq(1, 10)).

test_created(_) ->
    lists:foreach(
      fun(_) ->
              {201, _} = do_post_request(gen_random_url())
      end, lists:seq(1, 10)).

test_ok(_) ->
    lists:foreach(
      fun(_) ->
              NewUrl = gen_random_url(),
              {201, _} = do_post_request(NewUrl),
              {200, _} = do_post_request(NewUrl)
      end, lists:seq(1,10)).

test_redirect(_) ->
    LongUrl = gen_random_url(),
    {201, #{<<"url">> := ShortUrl}} = do_post_request(LongUrl),
    {302, #{<<"url">> := LongUrl}} = do_get_request(ShortUrl).

get_request_url(Url) ->
    BinaryReqUrl = iolist_to_binary([<<"http://localhost:8080/">>, Url]),
    UrlStr = binary_to_list(BinaryReqUrl),
    UrlStr.

json_to_map(In) ->
    InBinary = list_to_binary(In),
    case jsx:is_json(InBinary) of
        true -> jsx:decode(InBinary, [return_maps]);
        _ -> #{}
    end.

do_post_request(Url) ->
    ReqUrl = get_request_url(Url),
    {ok, {{_, StatusCode, _}, _, Body}} =
        httpc:request(post, {ReqUrl, [], [], []}, [], []),
    {StatusCode, json_to_map(Body)}.

do_get_request(Url) ->
    ReqUrl = get_request_url(Url),
    {ok, {{_, StatusCode, _}, _, Body}} =
        httpc:request(get, {ReqUrl, []},[{autoredirect,false}],[]),
    {StatusCode, json_to_map(Body)}.

start_web_server() ->
    application:ensure_all_started(shortener).

stop_web_server() ->
    application:stop(shortener).

gen_random_url() ->
    Random = base64:encode(crypto:strong_rand_bytes(10)),
    re:replace(Random, "/", "_", [global]).
