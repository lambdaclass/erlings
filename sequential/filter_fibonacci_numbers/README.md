# Filter Fibonacci Numbers

Create a function `filter_fibonacci_numbers:filter/1` that takes a list and filter every Fibonnaci number using **list comprehensions**.

Tip: The nth Fibonnaci number, *Fn*, can be calculated by the sum of the two preceding ones.
Using F0 = 1 and F1 = 1 as initial values we have:

1, 1, 2, 3, 5, 8, 13, 21, 54, ...

Example:
``` erlang
1> filter_fibonacci_numbers:filter([1, 2, 3, 4, 5, 7, 8]).
%% [1, 2, 3, 5, 8]
```

Write your answer in `src/filter_fibonacci_numbers.erl`. You can check your answer by doing `$> make` inside this directory.

If things gets difficult you can check our [proposed solution](solution/filter_fibonacci_numbers.erl).

# Reading material

- [Learn You Some Erlang: List Comprehensions](http://learnyousomeerlang.com/starting-out-for-real#list-comprehensions)
- [Fibonnaci number](https://en.wikipedia.org/wiki/Fibonacci_number)
