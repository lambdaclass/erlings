-module(calculate_bmi).

-export([bmi/1, classify/1]).

-include("person_record.hrl").

bmi(#person{weight = Weight, height = Height}) ->
    Weight / (Height * Height).

classify(Person) ->
    case bmi(Person) of
      BMI when BMI < 18.5 -> underweight;
      BMI when BMI < 25 -> normal;
      BMI when BMI < 30 -> overweight;
      _ -> obese
    end.
