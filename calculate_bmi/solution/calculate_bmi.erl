-module(calculate_bmi).

-export([bmi/1, classify/1]).

-include("../src/person_record.hrl").

bmi(P) when is_record(P, person) ->
    P#person.weight / math:pow(P#person.height, 2).

classify(P) ->
    case bmi(P) of
        BMI when BMI > 25 andalso BMI < 30->
            overweight;
        BMI when BMI < 18.5 ->
            underweight;
        BMI when BMI > 30 ->
            obese;
        BMI when BMI > 18.5 andalso BMI < 25 ->
            normal
    end.
