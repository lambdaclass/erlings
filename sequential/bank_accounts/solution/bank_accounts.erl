-module(bank_accounts).

-export([process_operation/2]).

operate({AccountNumber, Money}, withdraw, Amount) ->
  case (Money - Amount) < 0 of
    true  -> {error, insufficient_funds};
    false -> {AccountNumber, Money - Amount}
  end;
operate({AccountNumber, Money}, deposit, Amount) when Amount >= 0 ->
  {AccountNumber, Money + Amount}.

process_operation(Bank, {AccountNumber, Operation_Type, Amount}) ->
  case lists:keyfind(AccountNumber, 1, Bank) of
    false   -> {error, account_not_found};
    Account -> operate(Account, Operation_Type, Amount)
  end.
