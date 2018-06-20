require './lib/account.rb'
require './lib/transaction_log.rb'
require './lib/transaction.rb'
require './lib/printer.rb'

account = Account.new
# account.deposit(1000)
# account.deposit(2000)
# account.withdraw(500)
account.deposit(1000, '10/01/2012')
account.deposit(2000, '10/01/2012')
account.withdraw(500, '10/01/2012')
account.statement

# Uncomment line below to check if error is raised when amount to be withdrawn is > balance
# account.withdraw(5000)

# Uncomment line below to check if error is raised when amount to be deposited is < minimum deposit requirement
# account.deposit(-1)

# irb -r './lib/features.rb'
