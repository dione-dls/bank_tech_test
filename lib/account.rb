require_relative 'transaction'

class Account
  attr_reader :balance

  BALANCE = 0

  def initialize
    @balance = BALANCE
  end

  def deposit(amount)
    @balance += amount
    credit(amount)
  end

  def withdraw(amount)
    raise 'Insufficient funds' if insufficient_funds?(amount)
    @balance -= amount
    debit(amount)
  end

  private

  def insufficient_funds?(amount)
    amount > balance
  end

  def credit(amount)
    Transaction.new(@balance, amount, 'credit')
  end

  def debit(amount)
    Transaction.new(@balance, amount, 'debit')
  end
end
