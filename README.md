# Bank Tech Test
This is a practice tech test at Makers Academy which is designed to give us an idea of what tech tests are like in the real world.

This practice session is about producing the best code given a minimal time pressure where OO Design and TDD skills can be put into good practice.

## Getting Started
Using your command line, clone the repository to your local machine
```sh
git clone git@github.com:dione-dls/bank_tech_test.git
```
Switch to the cloned repo and install the necessary ruby gems
```sh
$ bundle install
```
Run RSpec to ensure all tests are passing
```sh
$ rspec
```
You may also run Rubocop to check style violations in the written code
```sh
$ rubocop
```

## Approach to Solving the Problem

To understand the requirements of the project, I began by creating a set of user stories from a bank client's perspective.

#### User Stories

```sh
AS A client
I WANT to open a bank account
SO THAT I have a place to keep my money
```
```sh
AS A client
I WANT to deposit money to my bank account
SO THAT I can increase the money I save
```
```sh
AS A client
I WANT to withdraw money from my bank account
SO THAT I can use some of the money that I have saved
```
```sh
AS A client
I WANT to see my bank account statement
SO THAT I can keep track of my bank account transactions
```
Next I have created a diagram to better understand what classes I need to create in order to make an application which I can interact with via a REPL like IRB.

Given my understanding of the problem, I have decided to create four classes: Account, Transaction, Transaction Log, and Printer. Each of these classes have single responsibilities as detailed in the diagram below.

![Diagram](https://github.com/dione-dls/bank_tech_test/blob/master/docs/bank-tech-test.png?raw=true)

This project was written entirely following a TDD approach.

## Running the Project

You may run the app in the command line in two ways:

1.) You may opt not to pass a date as an argument to the deposit and withdraw methods. This will assign the current date as the transaction date.
```sh
$ irb
$ require './lib/account.rb'
$ require './lib/transaction_log.rb'
$ require './lib/transaction.rb'
$ require './lib/printer.rb'
$ account = Account.new
$ account.deposit(1000)
$ account.deposit(2000)
$ account.withdraw(500)
$ account.statement
```
2.) You may pass a date as an argument to the deposit and withdraw methods. This will allow you to "backdate" transactions.
```sh
$ irb
$ require './lib/account.rb'
$ require './lib/transaction_log.rb'
$ require './lib/transaction.rb'
$ require './lib/printer.rb'
$ account = Account.new
$ account.deposit(1000, '10/01/2012')
$ account.deposit(2000, '13/01/2012')
$ account.withdraw(500, '14/01/2012')
$ account.statement
```
