-module(bank_accounts_test).

-include_lib("eunit/include/eunit.hrl").

-compile(export_all).
-compile(nowarn_export_all).

process_operation_withdraw_ok_test() ->
    Bank = [{213, 150}, {214, 0}],
    Op = {213, withdraw, 50},
    Res = {213, 100},
    ?assertEqual(Res, bank_accounts:process_operation(Bank, Op)).

process_operation_not_found_test() ->
    Bank = [{214, 0}],
    Op = {213, deposit, 20},
    Res = {error, account_not_found},
    ?assertEqual(Res, bank_accounts:process_operation(Bank, Op)).

process_operation_insufficient_funds_test() ->
    Bank = [{213, 150}, {214, 0}],
    Op = {213, withdraw, 200},
    Res = {error, insufficient_funds},
    ?assertEqual(Res, bank_accounts:process_operation(Bank, Op)).
