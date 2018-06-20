class Printer
  def pretty_print(all_transactions)
    header
    all_transactions.reverse_each do |transaction|
      puts " #{transaction.date} ||" \
      " #{format('%.2f', transaction.credit)} ||" \
      " #{format('%.2f', transaction.debit)} ||" \
      " #{format('%.2f', transaction.balance)} "
    end
  end

  private

  def header
    puts ' date || credit || debit || balance '
  end
end
