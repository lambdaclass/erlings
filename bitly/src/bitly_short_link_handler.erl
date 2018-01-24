-module(bitly_short_link_handler).

-export([init/2]).

init(Req, State) ->
    Url = binary_to_list(cowboy_req:path(Req)),
    case cowboy_req:method(Req) of
        <<"POST">> ->
            {Status, ShortUrl} = handle_post(Url);
        <<"GET">> ->
            {Status, ShortUrl} = handle_get(Url)
    end,
    Body = "{url: \"" ++ ShortUrl ++ "\"}",
    Header = #{<<"content-type">> => <<"application/json">>},
    Resp = cowboy_req:reply(Status, Header,Body,Req),
    {ok, Resp, State}.


handle_post(Url) ->
    {_,ShortUrl} = bitly_shortener:short(Url),
    {200,ShortUrl}.

handle_get(Url) ->
    case bitly_shortener:get(Url) of
        undefined -> {204, ""};
        ShortUrl -> {200, ShortUrl}
    end.
