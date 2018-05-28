-module(calculate_bmi).

-export([bmi/1, classify/1]).

-include("../src/person_record.hrl").

bmi(P) when is_record(P, person) ->
  P#person.weight / math:pow(P#person.height, 2).

classify(P) when is_record(P, person) ->
  classify(bmi(P));
classify(BMI) when BMI > 25 andalso BMI < 30 ->
  overweight;
classify(BMI) when BMI < 18.5 ->
  underweight;
classify(BMI) when BMI > 30 ->
  obese;
classify(BMI) when BMI > 18.5 andalso BMI < 25 ->
  normal.
