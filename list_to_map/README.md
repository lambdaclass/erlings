# List to Map

Create a function `list_to_map:to_map(L)` that converts a list to a [Map](http://learnyousomeerlang.com/maps) without using `maps:from_list`.

#### Examples
``` erlang
to_map([2, 1, 6, 4]).
%% #{1 => 2, 2 => 1, 3 => 6, 4 => 4}

to_map([]).
%% #{}
```

Check if your solution is working running `make`. And if your find
yourself in trouble you can always check our
[suggested solution](solution/list_to_map.erl).
