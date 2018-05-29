-module(hello_pattern).

-export([hello/1]).

hello({morning, _Name}) ->
  morning;
hello({evening,  Name}) ->
  {good, evening, Name};
hello({night,   _Name}) ->
  night;
hello({math_class,  Number, _Name}) when Number < 0 ->
  none;
hello({math_class, _Number,  Name}) ->
  {math_class, Name}.
