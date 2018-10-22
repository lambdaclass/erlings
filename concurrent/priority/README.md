# Priority

## Reading material

- [Learn You Some Erlang: More On Multiprocessing](http://learnyousomeerlang.com/more-on-multiprocessing)
- [Erlang Manual: processes](http://erlang.org/doc/reference_manual/processes.html)
- [Erlang Manual: receive expression](http://erlang.org/doc/reference_manual/expressions.html#id81776)

## Exercise

For this exercise we will process messages according to priorities from the erlang message box without using any data structure.  
Messages with priority `vip` should be processed _as soon as_ they enter the `priority_loop`. Carefully consider how messages are processed by a `receive` block, and how you can _combine_ more than one block to match clauses in a certain order. Hints on how to solve this found [here](http://learnyousomeerlang.com/more-on-multiprocessing).

You will write 3 functions for the `priority` module:
- `start/0`: This will create the process that will receive the messages (using `priority_loop/1`) and return its PID.
- `get_messages/1`: Given the PID will return all the messages stored in the receive loop state.
- `priority_loop/1`: This function will hold a list of messages received and read incoming messages. Remeber, messages need to be read according to their priority.

Notes:
- Messages are of the form `{Priority, Message}`.
- `Priority` is either `vip` or `normal`.
- `priority_loop/1` may receive other things to perform certain actions needed.

You can check your answer by doing `make concurrent/priority` from the root directory of your [erlings](https://github.com/lambdaclass/erlings) folder. If you wish you can also check our proposed [solution](solution).
