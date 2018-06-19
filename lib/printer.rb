class Printer
  def initialize(transaction_log = TransactionLog)
    @all_transactions = transaction_log
  end

  def pretty_print
    header
    @all_transactions.all.reverse_each do |transaction|
      puts " #{transaction.date} ||" \
      " #{format('%.2f', transaction.credit_amount)} ||" \
      " #{format('%.2f', transaction.debit_amount)} ||" \
      " #{format('%.2f', transaction.balance)} "
    end
  end

  private

  def header
    puts ' date || credit || debit || balance '
  end
end
