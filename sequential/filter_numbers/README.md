# Filter Numbers

## Reading material

- [Learn You Some Erlang: Starting Out (for real)](http://learnyousomeerlang.com/starting-out-for-real)
- How to make a list of numbers: [lists:seq/2](http://erlang.org/doc/man/lists.html#seq-2)

## Exercises

### Filter in

Create a function `filter_numbers:filter_in/3` that takes three integers (`From`, `To`, and `N`) and returns a list of all the numbers between `From` and `To` that are multiples of `N`. You **must** use list comprehension.

```erlang
1> filter_numbers:filter_in(1,100, 7).
[7,14,21,28,35,42,49,56,63,70,77,84,91,98]
```

### Filter out

Create a function `filter_numbers:filter_out/3` that takes three integers (`From`, `To`, and `N`) and returns a list of all the numbers between `From` and `To` that are **not** multiples of `N`. You **must** use list comprehension.

```erlang
1> filter_numbers:filter_out(1,10, 7).
[1,2,3,4,5,6,8,9,10]
```

### Filter in values

Create a function `filter_numbers:filter_in_values/3` that takes two integers and a tuple of two integers(`From`, `To`, and `{Min, Max}`) and returns a list of all the numbers between `From` and `To` that are between the values of `Min` and `Max`. You **must** use list comprehension.

```erlang
1> filter_numbers:filter_in_values(1,100,{25,38}).
[25,26,27,28,29,30,31,32,33,34,35,36,37,38]
```

## Testing your solution

To test your solution go to the root of the erlings folder and do `make sequential/filter_numbers`. This will run the tests for this specific exercise.

## Our solution

You can check our [proposed solution](solution/filter_numbers.erl).
