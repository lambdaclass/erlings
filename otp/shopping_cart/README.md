# Shopping Cart

## Reading Material

- [Learn You Some Erlang: What is OTP?](http://learnyousomeerlang.com/what-is-otp)
- [Learn You Some Erlang: Clients and Servers](http://learnyousomeerlang.com/clients-and-servers)

## Exercise

In this exercise we are going to model a shopping cart. You can put items inside it (an item is just a tuple `{ItemName, Price}`) and ask it for the total cost of all the items.

So, using a [gen_server](http://erlang.org/doc/man/gen_server.html), write the following functions:

* `shopping_cart:start_link/0`: Start an empty shopping cart.
* `shopping_cart:put_item/2`: Takes a PID and an item (a tuple) and saves it into the shopping cart.
* `shopping_cart:cost_so_far/1`: Calculates the cost of all the items inside the shopping cart.
* `finish/1`: Print the total price and finishes the shopping cart.

* All the functions required by the behaviour.

Example:
``` erlang
{ok, Pid} = shopping_cart:start_link().
shopping_cart:put_item(Pid, {orange, 2}).
%% [{orange, 2}]
shopping_cart:put_item(Pid, {apple, 1}).
%% [{apple, 1}, {orange, 2}]
shopping_cart:cost_so_far(Pid).
%% 3
```
[solution](src/solution/shopping_cart.erl)
