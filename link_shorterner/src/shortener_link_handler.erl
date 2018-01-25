-module(shortener_link_handler).

-export([init/2]).

init(Req, State) ->
    Url = get_request_url(Req),
    ReqMethod = cowboy_req:method(Req),
    {Status, ShortUrl} = handle_request(ReqMethod, Url),
    Body = "{url: \"" ++ ShortUrl ++ "\"}",
    Header = #{<<"content-type">> => <<"application/json">>},
    Resp = cowboy_req:reply(Status, Header, Body, Req),
    {ok, Resp, State}.

handle_request(<<"POST">>, Url) -> 
    {_, ShortUrl} = shortener_shortener:short(Url),
    {200, ShortUrl};
    
handle_request(<<"GET">>, Url) ->
    case shortener_shortener:get(Url) of
        not_found -> {204, ""};
        ShortUrl -> {200, ShortUrl}
    end.

get_request_url(Req) ->
    RequestPath = binary_to_list(cowboy_req:path(Req)),
    string:substr(RequestPath, 2).

    
