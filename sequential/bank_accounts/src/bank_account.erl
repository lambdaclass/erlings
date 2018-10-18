-module(bank_account).

-export([process_operation/2]).

process_operation(Bank,{AccNumber, Operation, Amount}) ->
    case find_account(Bank, AccNumber) of
      false -> {error, account_not_found};
      Account -> do_operation(Account, Operation, Amount)
    end.

find_account(Bank, AccNumber) -> lists:keyfind(AccNumber, 1, Bank).

do_operation({_AccNumber, Funds}, withdraw, Amount) when Funds < Amount ->
    {error, insufficient_funds};
do_operation({AccNumber, Funds}, withdraw, Amount) ->
    {AccNumber, Funds - Amount};
do_operation({AccNumber, Funds}, deposit, Amount) ->
    {AccNumber, Funds + Amount}.

