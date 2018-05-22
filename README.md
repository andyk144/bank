# Bank tech test
=================

### Technologies used:
-----
* Ruby 2.5.0
* Rspec
* Rubocop
* Simplecov

### Challenge
-----
* You should be able to interact with with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria
-----
**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
### Installation
-----
```
> git clone https://github.com/andyk144/bank.git
> cd bank
> bundle install
```

### Run code
-----
irb
```
> require './lib/bank.rb'
> account = BankAccount.new
> account.deposit(1000)
> account.deposit(2000)
> account.withdraw(500)
> account.statement
```
