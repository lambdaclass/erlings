Insert element at position
=======================

Since we already know recursion we can play a little bit more,
now consider we have a list of element, and we want to replace that
element with another one, but at the same time remember the old one.
For example if we have `[1,2,3]` and we replace the second element with
`"hi"`, it should be `[1, #{current => "hi", old => 2}]`. And if we
call that function with `[1, #{current => 10, old => 0}, 3]` replacing the
second element with "hi" the result should be `[1, #{current => "hi", old => 10}, 3]`.

The syntax `#{}` correspond to `maps`, you should check them
at [Maps Chapter](http://learnyousomeerlang.com/maps#what-maps-shall-be).

The function should be `insert_element_at:insert/3`. A sample call of the
previous example could be `insert([1,2,3], 2, "hi")`. If you are stuck or
want to compare check [our solution](solution/insert_element_at.erl).
