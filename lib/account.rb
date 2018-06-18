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
    raise 'Insufficient funds' if insufficient_funds?(amount)
    @balance -= amount
  end

  private

  def insufficient_funds?(amount)
    amount > balance
  end
end
