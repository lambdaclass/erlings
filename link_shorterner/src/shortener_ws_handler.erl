-module(shortener_ws_handler).

-export([init/2,
         websocket_init/1,
         websocket_handle/2,
         websocket_info/2,
         terminate/3]).

init(Req, Opts) ->
    {cowboy_websocket,Req,Opts}.

websocket_init(State) ->
    shortener_shortener:subscribe(self()),
    {ok, State}.

websocket_handle(_Msg, State) ->
    {ok, State}.

websocket_info(#{long_url := LongUrl, short_url := ShortUrl}, State) ->
    Response = get_ws_json_response(LongUrl, ShortUrl),
    {reply, {text, Response}, State};

websocket_info(_Info, State) ->
    {ok, State}.

terminate(_Msg, _Req, _State) ->
    shortener_shortener:unsubscribe(self()),
    ok.

get_ws_json_response(LongUrl, ShortUrl) ->
    Data = #{ <<"long_url">>  => LongUrl,
              <<"short_url">> => ShortUrl},
    jsone:encode(Data).
