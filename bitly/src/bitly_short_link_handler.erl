-module(bitly_short_link_handler).

-export([init/2]).

init(Req, State) ->
    case cowboy_req:method(Req) of
        <<"POST">> ->
            io:format("hi~n"),
            Url = binary_to_list(cowboy_req:path(Req)),
            io:format("url: ~p~n",[Url]),
            Body = "{response: \"was a post\"}";
        <<"GET">> ->
            Body = "{response: \"was a get\"}";
        {_Method,_} ->
            Body = "other method"
    end,
    Header = #{<<"content-type">> => <<"application/json">>},
    Resp = cowboy_req:reply(200, Header,Body,Req),
    {ok, Resp, State}.


