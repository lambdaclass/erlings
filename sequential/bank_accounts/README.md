# Bank Accounts

## Reading Material

- [Learn You Some Erlang: Errors and Exceptions](http://learnyousomeerlang.com/errors-and-exceptions)

## Exercise

Create a function `bank_account:process_operation/2` that takes a bank (a list of accounts: `{AccountNumber, AmountOfMoney}`) and an operation (a tuple: `{AccountNumber, Operation_Type, Amount}`) and process it, returning the resulting account.

#### Operations
There are two kind of operations: `withdraw` and `deposit`.

#### Examples

``` erlang
1> bank_account:process_operation([{1, 100}, {2, 45}], {1, withdraw, 25}).
%% {1, 75}

2> process_operation([{1, 100}, {2, 45}], {2, deposit, 15}).
%% {2, 60}
```

#### Error Handling
* If the account specified in the operation doesn't exist (i.e. there is no tuple in the list with that account number), return a tuple `{error, account_not_found}`.

* If you try to withdraw from an account with insufficient funds, return a tuple `{error, insufficient_funds}`.

#### Examples

``` erlang
1> bank_account:process_operation([{1, 100}, {2, 45}], {7, deposit, 55}).
%% {error, account_not_found}

2> bank_account:process_operation([{1, 100}, {2, 45}], {2, withdraw, 100}).
%% {error, insufficient_funds}
```

Run tests with `$> make`.

As a hint, the file you should be editing is `src/bank_account.erl`. But in any case if the things get difficult you can check our [proposed solution](solution/bank_account.erl).
