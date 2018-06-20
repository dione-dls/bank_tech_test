class Transaction
  attr_reader :balance, :credit, :debit, :date

  def initialize(balance, credit, debit, date)
    @balance = balance
    @credit = credit
    @debit = debit
    @date = date
  end
end
