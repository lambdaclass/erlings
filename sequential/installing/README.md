Installing
--------

In this exercise we will setup our environment before we start our
real coding. We will need some software:

- Check how to install [Erlang](https://www.erlang.org/).
- Install the main build tool [Rebar3](https://github.com/erlang/rebar3).
- Ensure that you have [Make](https://en.wikipedia.org/wiki/Make_(software))
  installed and running.

### Checking environment

To check your environment do the following:

~~~
$> git clone https://github.com/lambdaclass/erlings.git
$> cd ~/erlings/sequential/installing
$> make
~~~

You should get the following output:

~~~
rebar3 eunit
===> Verifying dependencies...
===> Compiling installing
===> Performing EUnit tests...
.

Top 1 slowest tests (0.000 seconds, 0.0% of total time):
  installing_test:installing_test/0: module 'installing_test'
    0.000 seconds

Finished in 0.032 seconds
1 tests, 0 failures
~~~
