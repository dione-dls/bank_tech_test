require 'printer'

describe Printer do
  let(:transaction_1) { double :transaction, balance: 1000, credit_amount: 1000, debit_amount: 0, date: '10/01/2012' }
  let(:transaction_2) { double :transaction, balance: 3000, credit_amount: 2000, debit_amount: 0, date: '13/01/2012' }
  let(:transaction_3) { double :transaction, balance: 2500, credit_amount: 0, debit_amount: 500, date: '14/01/2012' }
  let(:transaction_log) { double :transaction_log, all: [transaction_1, transaction_2, transaction_3] }
  subject(:printer) { described_class.new(transaction_log) }

  describe '#all_transactions' do
    it 'returns the transaction log' do
      expect(printer.all_transactions).to eq transaction_log
    end
  end

  describe '#pretty_print' do
    let(:pretty_print) {
      " date || credit || debit || balance \n " \
    "14/01/2012 || 0.00 || 500.00 || 2500.00 \n " \
    "13/01/2012 || 2000.00 || 0.00 || 3000.00 \n " \
    "10/01/2012 || 1000.00 || 0.00 || 1000.00 \n"
    }
    it 'pretty prints all the transactions related to the account' do
      expect { printer.pretty_print }.to output(pretty_print).to_stdout
    end
  end
end
