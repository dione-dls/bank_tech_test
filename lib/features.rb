require './lib/account.rb'
require './lib/transaction_log.rb'
require './lib/transaction.rb'
require './lib/printer.rb'

account = Account.new
transaction_log = TransactionLog.new
printer = Printer.new(transaction_log)
transaction_1 = account.deposit(1000)
transaction_log.add(transaction_1)
transaction_2 = account.deposit(2000) #
transaction_log.add(transaction_2)
transaction_3 = account.withdraw(500)
transaction_log.add(transaction_3)
printer.pretty_print

# Uncomment line below to check if error is raised when amount to be withdrawn is > balance
# account.withdraw(5000)

# Uncomment line below to check if error is raised when amount to be deposited is < minimum deposit requirement
# account.deposit(-1)

# irb -r './lib/features.rb'
