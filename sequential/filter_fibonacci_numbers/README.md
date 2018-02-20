# Filter Fibonacci Numbers

Create a function `filter_fib_numbers:filter/1` that takes a list and filter every Fibonnaci number using `list comprehensions`.

The nth Fibonnaci number, *Fn*, can be calculated by the sum of the two preceding ones.
Using F0 = 1 and F1 = 1 as initial values we have:

1, 1, 2, 3, 5, 8, 13, 21, 54, ...

Example:
``` erlang
filter([1, 2, 3, 4, 5, 7, 8]).
%%[1, 2, 3, 5, 8]
```

Run tests with ``make``.

As a hint, the file you should be editing is `src/filter_fib_numbers.erl`. But in any case if the things gets difficult you can check our [proposed solution](solution/filter_fib_numbers.erl).

# Reading material

- [Learn You Some Erlang: List Comprehensions](http://learnyousomeerlang.com/starting-out-for-real#list-comprehensions)

- [Fibonnaci number](https://en.wikipedia.org/wiki/Fibonacci_number)

- [_math_ Module Documentation](http://erlang.org/doc/man/math.html)
