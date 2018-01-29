Trade
=====

## Problem

Create an `OTP` application, that models the trading between to
individuals using two `gen_fsm`. The minimal required states are:

1. No trading
2. Waiting for trading response
3. Negotiation
4. Lock
5. No trading

Use `lagger` to register the operations.

## Run solution
Use `make` to run the tests.
