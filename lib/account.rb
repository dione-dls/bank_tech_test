class Account
  attr_reader :balance

  BALANCE = 0

  def initialize
    @balance = BALANCE
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end
