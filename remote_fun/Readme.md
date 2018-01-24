# Remote function server

## Problem
Create an Erlang cluster with 2 nodes. One node is a server that just receives a function and become it.
The other node sends a function the first and execute something remotely.

## Solution
The server (`remote_fun_server.erl`) receives a message as normal, and get the function from there. 

The client (`remote_fun_client.erl`) creates a function that is able to receive and loop, and also
to be killed, then it's send to the server.

### Running the solution

Run two terminals with ``erl -sname 'server@localhost'`` and ``erl -sname 'client@localhost'``.

Then connect the two nodes:
~~~
(client@localhost)1> net_kernel:connect_node(server@localhost).
true
~~~

~~~
(server@localhost)1> net_kernel:connect_node(client@localhost).
true
~~~

After the connections are fine, you can test the functions with:

~~~
(server@localhost)2> remote_fun_server:function_server().
~~~

~~~
(client@localhost)2> remote_fun_client:function_client(server@localhost).
Ok!
ok
~~~
