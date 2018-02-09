-module(filter_powers_of_2_test).


-include_lib("eunit/include/eunit.hrl").

filter_powers_of_2_test() ->
    List = [1, 2, 3, 4, 5, 7, 8],
    ?assertEqual([1, 2, 4, 8], filter_powers_of_2:filter_powers(List)).

