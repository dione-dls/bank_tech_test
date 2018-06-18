require 'date'

class Transaction
  attr_reader :balance, :credit_amount, :debit_amount, :date

  def initialize(balance, credit_amount, debit_amount)
    @balance = balance
    @credit_amount = credit_amount
    @debit_amount = debit_amount
    @date = Date.today.strftime
  end
end
