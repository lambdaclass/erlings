# Merge Map

Write a function `merge_map:merge/2` that merges 2 maps, if they have a key in common, keep the value from the second map.

Note: the function `maps:fold/3` can be useful.

#### Examples
``` erlang
merge_map:merge(#{}, #{a => 1, b => 2}).
%% #{a => 1, b => 2}

merge_map:merge(#{a => 1, b => 2}, #{a => 5, c => 3}).
%% #{a => 5, b => 2, c => 3}
```

Run tests with ``make``.

As a hint, the file you should be editing is `src/merge_map.erl`. But in any
case if the things get difficult you can check our [proposed solution](solution/merge_map.erl).
