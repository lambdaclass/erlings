# Priority exercise
Test processing messages with priorities from the erlang message box without using any data structure.

Run with `make` seeing test in line 55. The test shows that 'VIP' messages are prioritized ignoring the order
in the mailbox.

## Reading material

- [Erlang Manual: processes](http://erlang.org/doc/reference_manual/processes.html)
- [Erlang Manual: receive expression](http://erlang.org/doc/reference_manual/expressions.html#id81776)
- [EUnit Testing](http://erlang.org/doc/apps/eunit/chapter.html)
