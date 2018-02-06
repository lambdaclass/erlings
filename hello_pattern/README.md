Hello Pattern
===========

In this exercise you will introduced to pattern matching and guards,
but before we introduce the problem take your time to read
[Syntax in functions](learnyousomeerlang.com/syntax-in-functions).

Write a function `hello_pattern:hello/1` which takes a tuple:

- `{morning, Name}`, ignores the name and returns `morning`.
- `{evening, Name}`, returns a tuple `{good, evening, Name}`.
- `{night, Name}`, ignores the name and return `night`.
- `{math_class, Number, Name}`. If the number is lower than zero, return
  `none`, in any other case return `{math_class, Name}`.

Resolve this exercise without using `if`, `case`. You should use
pattern matching and guard only.

Check if your solution is working running `make`. And if your find
your self in trouble you can always check our
[suggested solution](solution/hello_pattern.erl).
