-module(shortener_ws_handler).

-export([init/2,
         websocket_init/1,
         websocket_handle/2,
         websocket_info/2]).

init(Req, Opts) ->
    {cowboy_websocket,Req,Opts}.

websocket_init(State) ->
    shortener_shortener:subscribe(self()),
    {ok, State}.

websocket_handle(_Msg, State) ->
    {ok, State}.

websocket_info(#{long_url := LongUrl, short_url := ShortUrl}, State) ->
    Response = iolist_to_binary([LongUrl, <<",">>, ShortUrl]),
    {reply, {text, Response}, State};

websocket_info(_Info, State) ->
    {ok, State}.
