# Ring benchmark

## Problem
Create N process in a ring. Send a message round the ring M times so
that a total of N * M messages get sent. Time how long this takes
for different values of N and M.


## Solution
Run `./run <n-processes> <m-messages>` to see the results. In my case:

~~~
./run 20 20
Processes:20, Messages:20 in 90ms
./run 20 200
Processes:20, Messages:200 in 787ms
./run 200 200
Processes:200, Messages:200 in 7998ms
~~~
