# Shortly: Link Shortener

## Reading material

- [Rebar3 build tool](https://github.com/erlang/rebar3)
- [Rebar3 hex](https://hex.pm/docs/rebar3_usage)
- [Cowboy http server](https://github.com/ninenines/cowboy)
- [Cowboy user-guide](https://ninenines.eu/docs/en/cowboy/2.2/guide/)

## Exercise

This exercise will be divided in multiple parts:

1. [Shortly application](#shortly-application)
1. [Create two nodes](#create-two-nodes)
1. [Mnesia](#mnesia)
1. [Syn](#syn)

### Shortly application

Create an ``OTP`` application using ``rebar3`` and [cowboy](https://github.com/ninenines/cowboy)
that is capable of receiving long links and returning shorts ones:

- Receive a ``HTTP POST`` at `http://localhost:8080/<LONG_URL>` returning a shortened link.
- Receive a ``HTTP GET`` at `http://localhost:8080/<SHORT_URL>` returning the original long link.
- Accept websocket connections at `http://localhost:8080/news` and notify every time a new link is shortened.

**BONUS:** Create similar endpoints (`GET` and `POST`), but using `cowboy_rest` handler.

### Create two nodes

Now that you have a working application for a single node we need to make it distributed. For this you will need to do the following:

- Receive cowboy's port as either a configuration variable or an environment variable.
- Set the node name when starting it.

### Mnesia

So we can have two nodes of our application running, but what is the point if they don't actually comunicate. To fix this we will make use of [Mnesia](http://erlang.org/doc/man/mnesia.html), which will let us have a distributed database across our nodes. To achieve this do the following:

- Create the Mnesia schema.
- Create the `shortly_urls` table.
- Add the Mnesia application as a dependency (no more manual starts).
- Change code to use Mnesia and abstract its usage to its own module `shortly_db`.

If everything went smoothly you should be able to create a short URL in one node, ask the other node for the long URL, and get your answer.

### Syn

For the final touch we need to let our users connect (websocket) to any node and still receive the notifications of link creations in all other nodes. For this task we will use [Syn](https://github.com/ostinelli/syn) and do the following:

- Add the Syn application as a dependency.
- Change code to use Syn and abstract it to a `shortly_presence` module.

Now no matter to what node your users are connected whenever a URL is shortened by their node or any other they should receive the notification.

## Solution

- ``src/bitly_short_link_handler.erl`` handles ``POST`` and ``GET`` requests.
- ``src/bitly_shortener`` is a ``gen_server`` that uses ``ets`` for storing the links in memory. Being a separated process from the normal ``cowboy`` request handler is very important because the ``ets`` data is lost if the process which created it dies, and the ``cowboy`` handlers processes are created and destroyed in every request.

To run the solution first star the server with ``make server`` and then ``make test`` for running simple requests.
