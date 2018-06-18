class Printer
  attr_reader :all_transactions

  def initialize(transaction_log)
    @all_transactions = transaction_log
  end

  def header
    puts ' date || credit || debit || balance '
  end
end
