Rotate Lists
------------

Create a function `rotations:rotate/2` that rotates the contents of a
list `n` positions. It should take 2 arguments:

- A list
- A tuple of `{left, N}` or `{right, N}` that indicates the direction
  and the size of the displacement expected.

For example calling `rotate([1, 2, 3, 4, 5], {right, 2})` should
return `[3,4,5,1,2]`.

Check it's working with `make test`. You can compare your code with
[our solution](solution/rotations.erl).
