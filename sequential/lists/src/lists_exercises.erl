-module(lists_exercises).

-export([even_fib_numbers/0, foldl/2, foldl/3,
	 list_any/2, reverse/1, rmconsecutive/1, rotate/2,
	 run_length_encode/1]).

reverse(List) -> reverse(List, []).

reverse([], Acc) -> Acc;
reverse([Head | Tail], Acc) ->
    reverse(Tail, [Head | Acc]).

rmconsecutive(List) -> rmconsecutive(List, []).

rmconsecutive([], Acc) -> reverse(Acc);
rmconsecutive([X | Tail], Acc = [X | _Rest]) ->
    rmconsecutive(Tail, Acc);
rmconsecutive([X | Tail], Acc) ->
    rmconsecutive(Tail, [X | Acc]).

even_fib_numbers() -> even_fib_numbers(1, 2, 0).

even_fib_numbers(I, _J, Sum) when I > 4000000 -> Sum;
even_fib_numbers(I, J, Sum) when I rem 2 == 0 ->
    even_fib_numbers(J, I + J, Sum + I);
even_fib_numbers(I, J, Sum) ->
    even_fib_numbers(J, I + J, Sum).

foldl(_Fun, Acc, []) -> Acc;
foldl(Fun, Acc, [Head | Tail]) ->
    foldl(Fun, Fun(Acc, Head), Tail).

foldl(_Fun, []) -> [];
foldl(Fun, [Head | Tail]) -> foldl(Fun, Head, Tail).

rotate([], {_direction, _N}) -> [];
rotate(List, {_direction, 0}) -> List;
rotate([Head | Tail], {left, N}) ->
    rotate(Tail ++ [Head], {left, N - 1});
rotate(List, {right, N}) ->
    rotate(List, {left, length(List) - N}).

run_length_encode(List) -> run_length_encode(List, []).

run_length_encode([], Acc) -> reverse(Acc);
run_length_encode([Head | Tail],
		  [[Count, Head] | Rest]) ->
    run_length_encode(Tail, [[Count + 1, Head] | Rest]);
run_length_encode([Head | Tail], Acc) ->
    run_length_encode(Tail, [[1, Head] | Acc]).

list_any(_Pred, []) -> false;
list_any(Pred, [Head | Tail]) ->
    case Pred(Head) of
      true -> true;
      false -> list_any(Pred, Tail)
    end.
