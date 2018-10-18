-module(bank_account).

-export([process_operation/2]).

process_operation(Bank,
		  {AccNumber, withdraw, Amount}) ->
    case lists:keyfind(AccNumber, 1, Bank) of
      false -> {error, account_not_found};
      {AccNumber, Funds} when Funds < Amount ->
	  {error, insufficient_funds};
      {AccNumber, Funds} -> {AccNumber, Funds - Amount}
    end;
process_operation(Bank, {AccNumber, deposit, Amount}) ->
    case lists:keyfind(AccNumber, 1, Bank) of
      false -> {error, account_not_found};
      {AccNumber, Funds} -> {AccNumber, Funds + Amount}
    end.
