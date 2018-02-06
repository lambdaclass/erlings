-module(hello_pattern_test).

-include_lib("eunit/include/eunit.hrl").

-compile(export_all).
-compile(nowarn_export_all).

hello_day_test() ->
  morning =
    hello_pattern:hello({morning, "Jimmy"}),
  {good, evening, "Rick"} =
    hello_pattern:hello({evening, "Rick"}),
  night =
    hello_pattern:hello({night, "Morty"}).

hello_math_class_test() ->
  none =
    hello_pattern:hello({math_class, -100, "K-Colored"}),
  {math_class, "Analysis II"} =
    hello_pattern:hello({math_class, 10, "Analysis II"}).
