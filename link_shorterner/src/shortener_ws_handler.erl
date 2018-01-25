-module(shortener_ws_handler).

-export([init/2,
         websocket_init/1,
         websocket_handle/2,
         websocket_info/2]).

init(Req, Opts) ->
    {cowboy_websocket,Req,Opts}.

websocket_init(State) ->
    % inicializacion despues del upgrade, aqui estamos recien en websocket
    shortener_shortener:subscribe(self()),
    {ok, State}.

websocket_handle(Msg, State) ->
    % handle received frames from the clients
    io:format("ws handle: ~p~n", [Msg]),
    {ok, State}.

websocket_info(#{long_url := LongUrl, short_url := ShortUrl}, State) ->
    Response = LongUrl++","++ShortUrl,
    {ok, {text, Response}, State};

websocket_info(Info, State) ->
    % info receives erlang msgs
    io:format("ws info: ~p~n",[Info]),
    {ok, State}.
