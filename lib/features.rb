require './lib/account.rb'

account = Account.new
account.deposit(1000)
account.deposit(2000)
account.withdraw(500)
p account
account.withdraw(5000)
p account


# irb -r './lib/features.rb'
