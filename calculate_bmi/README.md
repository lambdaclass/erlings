# Calculate BMI

Write a function `calculate_bmi:bmi/1` that takes a person (the record defined in `src/person_record.hrl`) as argument and calculate her [body mass index (BMI)](https://en.wikipedia.org/wiki/Body_mass_index).

Then, write `calculate_bmi:classify/1` to classify a person according to her BMI:

* `underweight`: when the BMI is less than 18.5.

* `normal`: when the BMI greater than 18.5 and less than 25. 

* `overweight`: when the BMI is between 25 and 30.

* `obese`: when the BMI is greater than 30.

#### Examples
``` erlang
calculate_bmi:bmi(#person{name = "Maria", weight = 60, height = 1.6}).
%% 23.437499999999996

calculate_bmi:classify(#person{name = "Maria", weight = 60, height = 1.6}).
%% normal
```

Run tests with ``make``.

As a hint, the file you should be editing is `src/calculate_bmi.erl`. But in any
case if the things get difficult you can check our [proposed solution](solution/calculate_bmi.erl).
