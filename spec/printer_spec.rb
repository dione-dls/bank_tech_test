require 'printer'

describe Printer do
  let(:transaction_1) { double :transaction, balance: 1000, credit: 1000, debit: 0, date: '10/01/2012' }
  let(:transaction_2) { double :transaction, balance: 3000, credit: 2000, debit: 0, date: '13/01/2012' }
  let(:transaction_3) { double :transaction, balance: 2500, credit: 0, debit: 500, date: '14/01/2012' }
  let(:transaction_log) { double :transaction_log, all: [transaction_1, transaction_2, transaction_3] }
  subject(:printer) { described_class.new }

  describe '#pretty_print' do
    let(:pretty_print) {
      " date || credit || debit || balance \n " \
    "14/01/2012 || 0.00 || 500.00 || 2500.00 \n " \
    "13/01/2012 || 2000.00 || 0.00 || 3000.00 \n " \
    "10/01/2012 || 1000.00 || 0.00 || 1000.00 \n"
    }
    it 'pretty prints all the transactions related to the account' do
      expect { printer.pretty_print(transaction_log.all) }.to output(pretty_print).to_stdout
    end
  end
end
