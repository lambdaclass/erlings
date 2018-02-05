Overflow
=====
Create an application with two processes, a producer and a consumer. The
consumer should be very slow to and process every message slowly in 
comparison to the producer. In this circumstances create an overflow
without crashing your computer.

## run
You can test this application running `make consumer` and `make producer`.

~~~erlang
(consumer@localhost)1> net_kernel:connect_node('producer@localhost').
true
(consumer@localhost)2> consumer:consume().
<0.113.0>
~~~

~~~erlang
(producer@localhost)1> net_kernel:connect_node('consumer@localhost').
true
(producer@localhost)2> producer:produce('consumer@localhost').
~~~

Then the consumer should output something similar to this
~~~
Processing <<"SquyWjNFxODZgljk1PG+BVCUNjs=">>
Processing <<"D4kSNw7tEK4R4bFHN9vthX0K6so=">>
Processing <<"Qp48QxWu8q52PmIrjqiacW8+Q8I=">>
Processing <<"yYURajSbBNWxifIxvKmOvAkuerQ=">>
Processing <<"TWNNsz16tvaRiPn4bpEwTwlosNM=">>
Processing <<"5s683BrGruaT9VLW8fAtYoT/LPA=">>
Processing <<"v7s/H3Fhn7wxZJJMJMAGxIxv3rE=">>
Processing <<"isIRKXYDtqJ1HxC+fCOq4sryL64=">>
(consumer@localhost)3> 
=ERROR REPORT==== 5-Feb-2018::13:03:21 ===
     Process:          <0.113.0> on node consumer@localhost
     Context:          maximum heap size reached
     Max Heap Size:    1024
     Total Heap Size:  1587
     Kill:             true
     Error Logger:     true
     GC Info:          [{old_heap_block_size,610},
                        {heap_block_size,986},
                        {mbuf_size,7},
                        {recent_size,87},
                        {stack_size,11},
                        {old_heap_size,0},
                        {heap_size,360},
                        {bin_vheap_size,0},
                        {bin_vheap_block_size,46422},
                        {bin_old_vheap_size,0},
                        {bin_old_vheap_block_size,46422}]
~~~
