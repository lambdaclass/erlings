-module(shortly_link_handler).

-export([init/2]).

init(Req, State) ->
    Url = get_request_url(Req),
    ReqMethod = cowboy_req:method(Req),
    {Status, ShortUrl} = handle_request(ReqMethod, Url),
    Body = get_body_response(Status, ShortUrl),
    Header = get_headers(Status, ShortUrl),
    Resp = cowboy_req:reply(Status, Header, Body, Req),
    {ok, Resp, State}.

handle_request(<<"POST">>, Url) -> 
    {CreationStatus, ShortUrl} = shortly_shortener:short(Url),
    HttpStatus =
        case CreationStatus of
            old -> 200; %ok
            new -> 201  %created
        end,
    {HttpStatus, ShortUrl};

handle_request(<<"GET">>, Url) ->
    case shortly_shortener:get(Url) of
        not_found -> {404, ""};
        ShortUrl  -> {302, ShortUrl}
    end.

get_request_url(Req) ->
    <<"/", Url/binary>> = cowboy_req:path(Req),
    Url.

get_body_response(404, _)   -> <<>>;
get_body_response(_,   Url) -> jsx:encode(#{url => Url }).

get_headers(Status, _) when Status =/= 302 -> 
    common_headers();
get_headers(302, RedirectUrl) ->
    CommonHeaders = common_headers(),
    CommonHeaders#{<<"location">> => RedirectUrl }.

common_headers() ->
    #{<<"content-type">> => <<"application/json">>}.
