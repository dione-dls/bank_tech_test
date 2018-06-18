class Printer
  attr_reader :all_transactions

  def initialize(transaction_log)
    @all_transactions = transaction_log
  end

  def header
    puts ' date || credit || debit || balance '
  end

  def statement
    header
    @all_transactions.all.reverse.each do |transaction|
    puts " #{ transaction.date } || #{ sprintf('%.2f', transaction.credit_amount) } || #{
    sprintf('%.2f', transaction.debit_amount) } || #{ sprintf('%.2f', transaction.balance) } "
    end
  end
end
