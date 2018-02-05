Overflow
=====
Create an application with two processes, a producer and a consumer. The
consumer should be very slow to and process every message slowly in 
comparison to the producer. In this circumstances create an overflow
without crashing your computer.

## run
You can test this application running `make consumer` and `make producer`.

~~~erlang
(consumer@consumer)1> net_kernel:connect_node('producer@producer').
true
~~~

~~~erlang
(producer@producer)1> net_kernel:connect_node('consumer@consumer').
true
(producer@producer)2> producer:produce('consumer@consumer').
~~~

You can follow the cpu and memory usage with `docker stats`.
