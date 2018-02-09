# Run-length encoding of a list

Implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as terms [N,E] where N is the number of duplicates of the element E.

Example:

``` erlang
run_length_encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
%%[[4,a],[1,b],[2,c],[2,a],[1,d],[4,e]]
```

Run tests with ``make``.

As a hint, the file you should be editing is `src/run_length_encoding.erl`. But in any case if the things get difficult you can check our [proposed solution](solution/run_length_encoding.erl).

# Reading material

- [Run-length enconding](https://en.wikipedia.org/wiki/Run-length_encoding)
- [Learn You Some Erlang: Recursion](http://learnyousomeerlang.com/recursion)
- [Learn You Some Erlang: Pattern Matching](http://learnyousomeerlang.com/syntax-in-functions#pattern-matching)
