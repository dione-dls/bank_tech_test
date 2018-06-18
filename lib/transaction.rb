require 'date'

class Transaction
  attr_reader :balance, :amount, :type, :date

  def initialize(balance, amount, type)
    @balance = balance
    @amount = amount
    @type = type
    @date = Date.today.strftime
  end
end
