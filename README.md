[![Build Status](https://travis-ci.org/lambdaclass/erlings.svg?branch=master)](https://travis-ci.org/lambdaclass/erlings)

# Erlings: Small exercises to get you used to reading and writing Erlang code

source: http://www.erlang.org/

> Erlang is a programming language used to build massively scalable soft real-time systems with requirements on high availability. Some of its uses are in telecoms, banking, e-commerce, computer telephony and instant messaging. Erlang's runtime system has built-in support for concurrency, distribution and fault tolerance.

One of the most important parts of any learning process it the resolution of practical problems by one self, but is hard when you don't have anything to guide you or something to compare with.

## Must Read
- Read [Learn you some Erlang for great good](http://learnyousomeerlang.com/)
- [Erlang and code style](https://medium.com/@jlouis666/erlang-and-code-style-b5936dceb5e4)
- Read our [guidelines](https://github.com/lambdaclass/guidelines)

## Exercises
The exercises are divided in 5 sections. They are meant to be done as you read [Learn you some Erlang for great good](http://learnyousomeerlang.com/), but feel free to do them as you wish. Click one to start!

### Sequential Programming

1. [Installing](sequential/installing/)
1. [Filter Fibonacci Numbers](sequential/filter_fibonacci_numbers/)
1. [Hello world](sequential/hello/)
1. [Hello pattern](sequential/hello_pattern/)
1. [Lists](sequential/lists/)
   1. [Reverse](sequential/lists#reverse)
   1. [Remove Consecutive](sequential/lists#remove-consecutive)
   1. [Even Fibonacci Numbers](sequential/lists#even-fibonacci-numbers)
   1. [Reduce](sequential/lists#reduce)
   1. [Rotate Lists](sequential/lists#rotate-lists)
   1. [Run-length Encoding of a List](sequential/lists#run-length-encoding-of-a-list)
   1. [Any](sequential/lists#any)
1. [Bank Accounts](sequential/bank_accounts/)
1. [Calculate BMI](sequential/calculate_bmi/)
1. [Insert element at position](sequential/insert_element_at/)
1. [Maps](sequential/maps/)
   1. [Mapping a Map](sequential/maps#mapping-a-map)
   1. [Merge Map](sequential/maps#merge-map)
   1. [List to Map](sequential/maps#list-to-map)
   1. [Records to Maps](sequential/maps#records-to-maps)
   1. [Maps to Records](sequential/maps#maps-to-records)
   1. [Proplist to Map](sequential/maps#proplist-to-map)

### Concurrent Programming

1. [Priority](concurrent/priority)
1. [Ring Benchmark](concurrent/ring_benchmark)

### OTP

1. [Shopping Cart](otp/shopping_cart/)

### Distributed Programming

1. [Remote Function](distributed/remote_fun/)

### Libraries

1. [Shortly](libraries/shortly/)

## Down the Rabbit Hole

### Advanced Erlang
- [How to build stable systems](https://medium.com/@jlouis666/how-to-build-stable-systems-6fe9dcf32fc4)
- [Stacking Theory for Systems Design](https://medium.com@jlouis666/stacking-theory-for-systems-design-2450e6300689)
- [A Ramble Through Erlang IO Lists](http://prog21.dadgum.com/70.html)
- [Erlang String Handling](https://medium.com/@jlouis666/erlang-string-handling-7588daad8f05)
- [How Erlang does scheduling](http://jlouisramblings.blogspot.com.ar/2013/01/how-erlang-does-scheduling.html)
- [Red and Green callbacks](https://joearms.github.io/published/2013-04-02-Red-and-Green-Callbacks.html)
- [RTB: Where Erlang BLOOMs](https://ferd.ca/rtb-where-erlang-blooms.html)
- [On Erlang, State and Crashes](http://jlouisramblings.blogspot.com.ar/2010/11/on-erlang-state-and-crashes.html)
- [It's About the Guarantees](https://ferd.ca/it-s-about-the-guarantees.html)
- [Don’t Lose Your ETS Tables](http://steve.vinoski.net/blog/2011/03/23/dont-lose-your-ets-tables/)
- [The Road we didn't go down ](http://armstrongonsoftware.blogspot.com.ar/2008/05/road-we-didnt-go-down.html)
- [Erlang Garbage Collection Details and Why It Matters](https://hamidreza-s.github.io/erlang%20garbage%20collection%20memory%20layout%20soft%20realtime/2015/08/24/erlang-garbage-collection-details-and-why-it-matters.html)
- [Sequence and Order in Erlang](https://web.archive.org/web/20160419085030/http://notdennisbyrne.blogspot.com.ar/2008/04/sequence-and-order-in-erlang.html)
- [The Erlang shell](https://medium.com/@jlouis666/the-erlang-shell-ab8d8bec3972)
- [Queues Don't Fix Overload](https://ferd.ca/queues-don-t-fix-overload.html)
- [https://www.erlang-in-anger.com/](https://www.erlang-in-anger.com/)
- Whatever you can find in [spawned shelter](http://spawnedshelter.com/)

### Distributed systems and databases
- [Distributed Systems: for fun and profit](http://book.mixu.net/distsys/single-page.html)
- Designing Data-intensive applications book
- [From the Ground Up: Reasoning About Distributed Systems in the Real World](https://bravenewgeek.com/from-the-ground-up-reasoning-about-distributed-systems-in-the-real-world/)
- [Jepsen: On the perils of network partitions](https://aphyr.com/posts/281-jepsen-on-the-perils-of-network-partitions)
- MapReduce: Simplified Data Processing on Large Clusters
- Dynamo: Amazon’s Highly Available Key-value Store
- Bigtable: A Distributed Storage System for Structured Data
- Time, Clocks and Ordering of Events in a Distributed System
- Unreliable failure detectors and reliable distributed systems

### Riak and riak_core
- [Riak Core Tutorial](https://github.com/lambdaclass/riak_core_tutorial/)

### Elixir
- [Erlang/Elixir Syntax: A Crash Course](https://elixir-lang.org/crash-course.html)
- [Elixir: Introduction](https://elixir-lang.org/getting-started/introduction.html)
- [Phoenix: Overview](https://hexdocs.pm/phoenix/overview.html)
- [Phoenix: Up and Running](https://hexdocs.pm/phoenix/up_and_running.html#content)
- [GenState](https://hexdocs.pm/gen_stage/GenStage.html)
- [GenStage advanced](https://elixirschool.com/en/lessons/advanced/gen-stage/)
