# Bank Tech Test
This is a practice tech test at Makers Academy which is designed to give us an idea of what tech tests are like in the real world.

This practice session is about producing the best code given a minimal time pressure where OO Design and TDD skills can be put into good practice.

## Running the Project
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

  To understand the requirements of the project, I began by creating user stories from a bank client's perspective.

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



  - possible additional features
  - list dependencies here
