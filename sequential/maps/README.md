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

### Records to Maps

Create a record named `person` that has the attributes `name` and `age`. Then write a function `map:records_to_maps(Records)` that converts a list of records (in this case people) into a list of maps with the attributes. For this you should use `lists:map`.

Example:
```erlang
map:records_to_maps([]).
%% []

map:records_to_maps([#person{name="Pepe", age=28}, #person{name="Luis", age=77}]).
%% [#{age => 28,name => "Pepe"},#{age => 77,name => "Luis"}]
```

[solution](src/solution/records_to_maps.erl).

### Maps to Records

Create a record named `person` that has the attributes `name` and `age`. Then write a function `map:maps_to_records(Records)` that converts a list of maps into a list of records (in this case people). For this you should only use recursion.

Example:
```erlang
map:maps_to_records([]).
%% []

map:maps_to_records([#{age => 28,name => "Pepe"},#{age => 77,name => "Luis"}]).
%% [#{age => 77,name => "Luis"}, #{age => 28,name => "Pepe"}]
```

[solution](src/solution/maps_to_records.erl).

### Proplist to Map

Write a recursive function `proplist_to_map/1` that takes a proplist (a list of tuples) and builds a map from it. Use the first component of each tuple as the key and the second component as the value.

Example:
```erlang
map:proplist_to_map([]).
%% #{}

map:proplist_to_map([{firstname, "Pedro"}, {lastname, "Sanches"}, {age, 11}]).
%% #{age => 11,firstname => "Pedro",lastname => "Sanches"}
```
