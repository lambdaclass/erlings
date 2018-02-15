-module(calculate_bmi_test).

-include_lib("eunit/include/eunit.hrl").

-include("../src/person_record.hrl").

calculate_bmi_bmi_calculation_test() ->
    Person = #person{ name = "Alicia", weight = 62, height = 1.63},
    ?assertEqual(23.335466144755166, calculate_bmi:bmi(Person)).

calculate_bmi_classify_test() ->
    Person1 = #person{ name = "Alicia", weight = 62, height = 1.63},
    Person2 = #person{ name = "Peter", weight = 104, height = 1.8},
    Person3 = #person{ name = "Ana", weight = 52, height = 1.7},
    Person4 = #person{ name = "Charles", weight = 84, height = 1.75},
    ?assertEqual(normal, calculate_bmi:classify(Person1)),
    ?assertEqual(obese, calculate_bmi:classify(Person2)),
    ?assertEqual(underweight, calculate_bmi:classify(Person3)),
    ?assertEqual(overweight, calculate_bmi:classify(Person4)).
