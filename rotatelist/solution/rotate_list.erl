-module(rotate_list).

-export([rotate/2]).

rotate([], _) ->
    [];
rotate(L, {Dir, N}) ->
    case Dir of
	left ->
	    {Right, Left} = lists:split(length(L) - N, L);
	right ->
	    {Right, Left} = lists:split(N, L)
    end,
    lists:append(Left, Right).
