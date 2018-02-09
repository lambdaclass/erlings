# Mapping a Map

Write a function `mapping_a_map:map(Function, Map)` for mapping a function over the values of a Map without using `maps:map`.

#### Examples
``` erlang
mapping_a_map:map(fun(X) -> X + 1 end, #{a => 4, b => 2}).
%% #{a => 5, b => 3}

mapping_a_map:map(#{}).
%% #{}
```

Check if your solution is working running `make`. And if your find
yourself in trouble you can always check our [suggested solution](solution/mapping_a_map.erl).
