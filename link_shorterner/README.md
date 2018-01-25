Link Shortener
=====

## Problem
Create an ``OTP`` application using ``rebar3`` and [cowboy](https://github.com/ninenines/cowboy)
that is capable of receiving long links and returning shorts ones:

* Receive a ``HTTP POST`` at `http://localhost:8080/<LONG_URL>` returning a shortened link. 
* Receive a ``HTTP GET`` at `http://localhost:8080/<SHORT_URL>` returning the original
  long link.

## Solution

* ``src/bitly_short_link_handler.erl`` handles ``POST`` and ``GET`` requests.
* ``src/bitly_shortener`` is a ``gen_server`` that uses ``ets`` for storing the links
  in memory. Being a separated process from the normal ``cowboy`` request handler is very 
  important because the ``ets`` data is lost if the process which created it dies, and
  the ``cowboy`` handlers processes are created and destroyed in every request.
  
To run the solution first star the server with ``make server`` and then ``make samples`` for
running simple requests.
