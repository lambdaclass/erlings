# Maps

## Reading Material

- [Learn You Some Erlang: Maps](http://learnyousomeerlang.com/maps)

## Exercises

### Merge Map

Write a function `maps_exercises:merge/2` that merges 2 maps, if they have a key in common, keep the value from the second map.

Note: the function `maps:fold/3` can be useful.

Example:
``` erlang
1> maps_exercises:merge(#{}, #{a => 1, b => 2}).
%% #{a => 1, b => 2}

2> maps_exercises:merge(#{a => 1, b => 2}, #{a => 5, c => 3}).
%% #{a => 5, b => 2, c => 3}
```
[solution](src/solution/maps_exercises.erl#L6-L7).

### Mapping a Map

Write a function `maps_exercises:map/2` for mapping a function over the values of a Map without using `maps:map/2`.

Example:
``` erlang
1> maps_exercises:map(fun(X) -> X + 1 end, #{a => 4, b => 2}).
%% #{a => 5, b => 3}

2> maps_exercises:map(#{}).
%% #{}
```
[solution](src/solution/maps_exercises.erl#L10-L13).

### List to Map

Create a function `maps_exercises:to_map/1` that converts a list to a [Map](http://learnyousomeerlang.com/maps) without using `maps:from_list`.

Example:
``` erlang
1> maps_exercises:to_map([2, 1, 6, 4]).
%% #{1 => 2, 2 => 1, 3 => 6, 4 => 4}

2> maps_exercises:to_map([]).
%% #{}
```
[solution](src/solution/maps_exercises.erl#L16-L24).

### Records to Maps

Create a record named `person` that has the attributes `name` and `age`. Then write a function `maps_exercises:records_to_maps(Records)` that converts a list of records (in this case people) into a list of maps with the attributes. For this you should use `lists:map`.

Example:
```erlang
1> maps_exercises:records_to_maps([]).
%% []

2> maps_exercises:records_to_maps([#person{name="Pepe", age=28}, #person{name="Luis", age=77}]).
%% [#{age => 28,name => "Pepe"},#{age => 77,name => "Luis"}]
```

[solution](src/solution/maps_exercises.erl#L27-L30).

### Maps to Records

Create a record named `person` that has the attributes `name` and `age`. Then write a function `maps_exercises:maps_to_records(Records)` that converts a list of maps into a list of records (in this case people). For this you should only use recursion.

Example:
```erlang
1> maps_exercises:maps_to_records([]).
%% []

2> maps_exercises:maps_to_records([#{age => 28,name => "Pepe"},#{age => 77,name => "Luis"}]).
%% [#person{name = "Luis",age = 77}, #person{name = "Pepe",age = 28}]
```

[solution](src/solution/maps_exercises.erl#L33-L38).

### Proplist to Map

**DISCLAIMER** Erlang provides functions for the following task: `maps:from_list` and `maps:to_list`, but we want you to implement it by hand.

Write a recursive function `proplist_to_map/1` that takes a proplist (a list of tuples) and builds a map from it. Use the first component of each tuple as the key and the second component as the value.


Example:
```erlang
1> maps_exercises:proplist_to_map([]).
%% #{}

2> maps_exercises:proplist_to_map([{firstname, "Pedro"}, {lastname, "Sanches"}, {age, 11}]).
%% #{age => 11,firstname => "Pedro",lastname => "Sanches"}
```

[solution](src/solution/maps_exercises.erl#L41-L44).
