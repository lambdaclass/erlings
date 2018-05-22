# Calculator

## Reading Material

- [The Hitchhiker's Guide to Concurrency](http://learnyousomeerlang.com/the-hitchhikers-guide-to-concurrency)
- [More On Multiprocessing](http://learnyousomeerlang.com/more-on-multiprocessing)

## Task

You will write a simple calculator (sum, substraction, multiplication, and division) using processes and passing messages. For this you will write a module `calculator` and create the following functions:

- `start_calculator/0`: This functions will spawn a `calculator:calculator_server/1`.
- `calculator_server/0`: It will receive through messages the operation to execute and its arguments, and send back the result.
- `turn_off/1`: Shuts down the calculator server.

This is the bare minimum you need to make a working example, but we won't stop there so will use what you learned in ["We Love Messages, but we keep them secret"](http://learnyousomeerlang.com/more-on-multiprocessing#secret-messages) to abstract everything to simple functions the user can use without knowing about underlying protocol. For this create the functions: `add/3, substract/3, multiply/3, divide/3`. This functions will receive as input PID and a tuple contaning the two numbers to operate on, send the message to the calculator server, and return the result.

```erlang
1> Cal = calculator:start_calculator().
<0.67.0>

2> calculator:add(Cal, 1, 3).
4

3> calculator:substract(Cal, 1, 3).
-2

4> calculator:multiply(Cal, 7, 3).
21

5> calculator:divide(Cal, 7, 3).
2.3333333333333335

6> calculator:divide(Cal, 0, 3).
0.0

7> calculator:divide(Cal, 2, 3).
0.6666666666666666

8> calculator:turn_off(Cal).
off
```

Check our proposed [solution](solution/calculator.erl).
