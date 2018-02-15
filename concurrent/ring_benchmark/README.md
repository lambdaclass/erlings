# Ring benchmark

## Problem
Write a function `ring:ring/2` which takes 2 arguments: M and N.
This function should create N process in a ring in such a way
that sending a message to the first process it get passed around
the ring M times so that a total of N * M messages get sent.

In case you need any guidance please check our
[proposed solution](solution/ring.erl).
