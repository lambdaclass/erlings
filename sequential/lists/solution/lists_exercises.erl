-module(lists_exercises).

-export([reverse/1,
         rmconsecutive/1,
         even_fib_numbers/0,
         foldl/2,
         foldl/3,
         rotate/2,
         run_length_encode/1,
         list_any/2,
         anagram/2]).


% Reverse
reverse(List) ->
  reverse(List, []).

reverse([], Acc) ->
  Acc;
reverse([H|T], Acc) ->
  reverse(T, [H|Acc]).

% Remove Consecutive
rmconsecutive([]) ->
  [];
rmconsecutive([H|T]) ->
  rmconsecutive(H, T).

rmconsecutive(E, []) ->
  [E];
rmconsecutive(E, [E|T]) ->
  rmconsecutive(E,T);
rmconsecutive(E, [H|T]) ->
  [E| rmconsecutive(H,T)].

% Even Fibonacci Numbers
fib(1) ->
  1;
fib(2) ->
  2;
fib(N) when N > 2 ->
  fib(N-1) + fib(N-2).

% list of every fibonacci number less than N.
fibs_less_than(N) when N < 1->
  [];
fibs_less_than(N) ->
  fibs_less_than(N, 1, []).

fibs_less_than(N, M, AccList) ->
  FibM = fib(M),
  case FibM < N of
    true ->
      fibs_less_than(N, M + 1, [ FibM | AccList]);
    false ->
      AccList
  end.

even_fib_numbers() ->
  Less_than_4mill = fibs_less_than(4000000),
  Even_fibs = lists:filter(fun(X) -> X rem 2 == 0 end, Less_than_4mill),
  lists:sum(Even_fibs).

% Reduce
% with accumulator
foldl(_, Acc, []) ->
  Acc;
foldl(Fun, Acc, [A | T]) ->
  NewAcc = Fun(A,Acc),
  foldl(Fun,NewAcc,T).

% w/o accumulator
foldl(_, List) when length(List) < 2 ->
  undefined;
foldl(Fun, [A, B | T]) ->
  foldl(Fun, A, [B | T]).

% Rotate Lists
rotate([], _) ->
  [];
rotate(L, {Dir, N}) ->
  case Dir of
  left ->
      {Right, Left} = lists:split(N, L);
  right ->
      {Right, Left} = lists:split(length(L) - N, L)
  end,
  lists:append(Left, Right).

% Run-length encoding of a list
run_length_encode([[Count, H]|[]]) ->
  [[Count, H]];
run_length_encode([[Count, H1], H1|T]) ->
  run_length_encode([[Count + 1, H1]|T]);
run_length_encode([[Count, H1], H2|T]) ->
  [[Count, H1]|run_length_encode([[1, H2]|T])];
run_length_encode([H|T]) ->
  run_length_encode([[1, H]|T]);
run_length_encode([]) ->
  [].

% Any
list_any(F, List) ->
  lists:foldl(fun(X, Y) -> F(X) or Y end, false, List).

%Anagram
anagram(List, S) -> 
    anagram(List, S, []).

anagram([], _S, Acc) -> Acc;
anagram([H|T], S, Acc) ->
    LowerH = string:lowercase(H),
    LowerS = string:lowercase(S),
    case LowerH == LowerS of
      true ->
        anagram(T,S,Acc);
      false ->
        case lists:sort(LowerH) == lists:sort(LowerS) of
          true ->
            anagram(T, S, [H|Acc]);
          false->
            anagram(T,S,Acc)
    end
  end.