require './lib/account.rb'
require './lib/transaction_log.rb'
require './lib/transaction.rb'
require './lib/printer.rb'

def make_a_deposit
  account = Account.new
  account.deposit(1000)
end

def deposit_below_required_minimum
  account = Account.new
  account.deposit(1000)
  account.deposit(-100)
end

def make_a_withdrawal
  account = Account.new
  account.deposit(1000)
  account.withdraw(500)
end

def withdraw_more_than_current_balance
  account = Account.new
  account.deposit(1000)
  account.withdraw(5000)
end

def withdraw_below_required_minimum
  account = Account.new
  account.deposit(1000)
  account.withdraw(-100)
end

def check_balance
  account = Account.new
  account.deposit(1000)
  account.deposit(2000)
  account.withdraw(500)
  account.balance
end

def view_statement
  account = Account.new
  account.deposit(1000)
  account.deposit(2000)
  account.withdraw(500)
  account.statement
end
