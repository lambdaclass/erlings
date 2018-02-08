-module(bank_accounts_test).

-include_lib("eunit/include/eunit.hrl").

-compile(export_all).
-compile(nowarn_export_all).

process_operation_test1() ->
    Bank = [{213, 150}, {214, 0}],
    Op = {213, withdraw, 50},
    {213, 100} = bank_accounts:process_operation(Bank, Op).

process_operation_test2() ->
    Bank = [{214, 0}],
    Op = {213, deposit, 20},
    {error, account_not_found} = bank_accounts:process_operation(Bank, Op).

process_operation_test3() ->
    Bank = [{213, 150}, {214, 0}],
    Op = {213, withdraw, 200},
    {error, insufficient_funds} = bank_accounts:process_operation(Bank, Op).
