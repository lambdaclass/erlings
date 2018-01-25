-module(shortener_shortener).

-export([short/1, get/1]).

-export([start_link/0, init/1, handle_call/3, handle_cast/2]).

-behaviour(gen_server).

short(Url) ->
    gen_server:call(?MODULE, {short, Url}).

get(Url) ->
    gen_server:call(?MODULE, {get, Url}).

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

init(_Args) ->
    Ets = ets:new(links, [set]),
    {ok,Ets}.

handle_call({short, LongUrl}, _From, Ets) ->
    ShortUrl = shortening_algorith(LongUrl),
    EntryType = store_url(Ets, LongUrl, ShortUrl),
    {reply, {EntryType, ShortUrl}, Ets};

handle_call({get, ShortUrl}, _From, Ets) ->
    LongUrl = search_long_url(Ets, ShortUrl),
    {reply, LongUrl, Ets}.

handle_cast(_, Ets) -> {noreply, Ets}.

shortening_algorith(Url) ->
    Hash = crypto:hash(md4, Url),
    Base64 = base64:encode_to_string(Hash),
    Sub = string:substr(Base64, 1, 5),
    WithoutSlashes = re:replace(Sub, "/", "_", [global, {return, list}]),
    WithoutSlashes.

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
