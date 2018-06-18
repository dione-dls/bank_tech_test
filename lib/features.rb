require './lib/account.rb'
require './lib/transaction_log.rb'
require './lib/transaction.rb'

account = Account.new
transaction_1 = account.deposit(1000)
transaction_log = TransactionLog.new
transaction_log.add(transaction_1)
transaction_log.all
transaction_2 = account.deposit(2000)
transaction_log.add(transaction_2)
transaction_log.all

account.withdraw(500)
p account
account.withdraw(5000)
p account


# irb -r './lib/features.rb'
