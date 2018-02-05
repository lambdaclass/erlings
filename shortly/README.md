Shortly: Link Shortener
=====

## Problem
Create an ``OTP`` application using ``rebar3`` and [cowboy](https://github.com/ninenines/cowboy)
that is capable of receiving long links and returning shorts ones:

* Receive a ``HTTP POST`` at `http://localhost:8080/<LONG_URL>` returning a shortened link. 
* Receive a ``HTTP GET`` at `http://localhost:8080/<SHORT_URL>` returning the original
  long link.
* Accept websocket connections at `http://localhost:8080/news` and notify every time a new
  link is shortened.

## Solution

* ``src/bitly_short_link_handler.erl`` handles ``POST`` and ``GET`` requests.
* ``src/bitly_shortener`` is a ``gen_server`` that uses ``ets`` for storing the links
  in memory. Being a separated process from the normal ``cowboy`` request handler is very 
  important because the ``ets`` data is lost if the process which created it dies, and
  the ``cowboy`` handlers processes are created and destroyed in every request.
  
To run the solution first star the server with ``make server`` and then ``make test`` for
running simple requests.

## Reading material

- [Rebar3 build tool](https://github.com/erlang/rebar3)
- [Rebar3 hex](https://hex.pm/docs/rebar3_usage)
- [Cowboy http server](https://github.com/ninenines/cowboy)
- [Cowboy user-guide](https://ninenines.eu/docs/en/cowboy/2.2/guide/)
