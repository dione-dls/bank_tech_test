require 'date'

class Transaction
  attr_reader :type, :balance, :amount, :date

  def initialize(type, balance, amount, date)
    @type = type
    @balance = balance
    @amount = amount
    @date = date
  end

  def classify
    if @type == 'credit'
      { balance: @balance,
        credit_amount: @amount,
        debit_amount: 0,
        date: @date
      }
    elsif @type == 'debit'
      { balance: @balance,
        credit_amount: 0,
        debit_amount: @amount,
        date: @date
      }
    end
  end
end
