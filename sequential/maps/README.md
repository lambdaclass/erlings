# Maps

[Relevant chapter in Learn You Some Erlang](http://learnyousomeerlang.com/maps)

## Exercises
### Merge Map

Write a function `map:merge/2` that merges 2 maps, if they have a key in common, keep the value from the second map.

Note: the function `maps:fold/3` can be useful.

Example:
``` erlang
merge_map:merge(#{}, #{a => 1, b => 2}).
%% #{a => 1, b => 2}

merge_map:merge(#{a => 1, b => 2}, #{a => 5, c => 3}).
%% #{a => 5, b => 2, c => 3}
```
[solution](src/solution/merge_map.erl).

### Mapping a Map

Write a function `map:map(Function, Map)` for mapping a function over the values of a Map without using `maps:map`.

Example:
``` erlang
map:map(fun(X) -> X + 1 end, #{a => 4, b => 2}).
%% #{a => 5, b => 3}

map:map(#{}).
%% #{}
```
[solution](src/solution/mapping_a_map.erl).

### List to Map

Create a function `map:to_map(L)` that converts a list to a [Map](http://learnyousomeerlang.com/maps) without using `maps:from_list`.

Example:
``` erlang
to_map([2, 1, 6, 4]).
%% #{1 => 2, 2 => 1, 3 => 6, 4 => 4}

to_map([]).
%% #{}
```
[solution](src/solution/list_to_map.erl).
