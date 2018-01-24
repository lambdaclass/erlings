-module(bitly_shortener).

-export([short/1, get/1]).

-export([start_link/0, init/1, handle_call/3, handle_cast/2]).

-behaviour(gen_server).

short(Url) ->
    gen_server:call(shortener,{short,Url}).

get(Url) -> 
    gen_server:call(shortener,{get,Url}).

start_link() ->
    gen_server:start_link({local, link_shortener}, ?MODULE,[],[]).

init(_Args) ->
    register(shortener, self()),
    Ets = ets:new(links, [set]),
    Ets.

handle_call({short, LongUrl}, _From, Ets) -> 
    ShortUrl = shortening_algorith(LongUrl),
    case ets:lookup(Ets, ShortUrl) of
        [] -> 
            EntryType = new,
            ets:insert(Ets, {ShortUrl,LongUrl});
        [{ShortUrl,LongUrl}] -> 
            EntryType = old,
            ok
    end,
    {reply,{EntryType,ShortUrl}, Ets};

handle_call({get, ShortUrl},_From,Ets) ->
    case ets:lookup(Ets, ShortUrl) of
        [] -> LongUrl = undefined;
        [{ShortUrl,LongUrl}] -> ok
    end,
    {reply,LongUrl,Ets}.
    
handle_cast(_,Ets) -> {noreply,Ets}.

shortening_algorith(Url) ->
    Hash = crypto:hash(md4,Url),
    Base64 = base64:encode_to_string(Hash),
    string:substr(Base64,1,5).
    
        
    
