# Parallel Map

## Reading Material

- [The Hitchhiker's Guide to Concurrency](http://learnyousomeerlang.com/the-hitchhikers-guide-to-concurrency)
- [More On Multiprocessing](http://learnyousomeerlang.com/more-on-multiprocessing)

## Exercise

You will write `parallel_map:pmap/2` a parallel implementation of [lists:map](http://erlang.org/doc/man/lists.html#map-2). Every element in the input list must me processed by a separate process, this means that a list of 100 elements will spawn 100 processes.

```erlang
1> Fun = fun(X) -> X * 10 end,
2> List = [1, 2, 3, 4, 5],
3> parallel_map:pmap(Fun, List)
[10,20,30,40,50]
```

Check our proposed [solution](solution/parallel_map.erl).
