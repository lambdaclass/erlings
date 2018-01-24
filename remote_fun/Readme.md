# Remote function server

## Problem
Create an Erlang cluster with 2 nodes. One node is a server that just receives a function and become it.
The other node sends a function the first and execute something remotely.

## Solution
The server (`remote_fun_server.erl`) receives a message as normal, and get the function from there. 
The server also send a confirmation upon function reception to let the client know it was successful.

The client (`remote_fun_client.erl`) creates a function that is able to receive and loop, and also
to be killed, then it's send to the server.

There is also a (`fun_common.hrl`), that holds common functions related to trying connect between nodes,
this is for avoiding race conditions. Even if the use `.hrl` can be a bad practice, in this simple example
without any project may be justifiable to show the `-include` and headers.

Both, client and server are started with the `make` command, that spawns two named nodes using the same
cookie. If the final output is `Ok!`, it works correctly. 
