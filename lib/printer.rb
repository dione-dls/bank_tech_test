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
    @all_transactions.all.reverse_each do |transaction|
      puts " #{transaction.date} ||" \
      " #{format('%.2f', transaction.credit_amount)} ||" \
      " #{format('%.2f', transaction.debit_amount)} ||" \
      " #{format('%.2f', transaction.balance)} "
    end
  end
end
