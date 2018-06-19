require_relative 'transaction'

class Account
  attr_reader :balance

  BALANCE = 0
  MINIMUM_DEPOSIT = 1
  MINIMUM_WITHDRAWAL = 1

  def initialize
    @balance = BALANCE
    @minimum_deposit = MINIMUM_DEPOSIT
    @minimum_withdrawal = MINIMUM_WITHDRAWAL
  end

  def deposit(amount)
    raise 'Amount below minimum deposit requirement' if below_min_deposit?(amount)
    @balance += amount
    credit(amount)
  end

  def withdraw(amount)
    raise 'Insufficient funds' if insufficient_funds?(amount)
    raise 'Amount below minimum withdrawal requirement' if below_min_withdrawal?(amount)
    @balance -= amount
    debit(amount)
  end

  private

  def insufficient_funds?(amount)
    amount > @balance
  end

  def below_min_deposit?(amount)
    amount < @minimum_deposit
  end

  def below_min_withdrawal?(amount)
    amount < @minimum_withdrawal
  end

  def credit(amount)
    Transaction.new(@balance, amount, 0)
  end

  def debit(amount)
    Transaction.new(@balance, 0, amount)
  end
end
