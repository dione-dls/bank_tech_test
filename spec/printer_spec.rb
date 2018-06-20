require 'printer'

describe Printer do
  let(:all_transactions) {
    [{ balance: 1000, credit_amount: 1000, debit_amount: 0, date: '10/01/2012' },
     { balance: 3000, credit_amount: 2000, debit_amount: 0, date: '13/01/2012' },
     { balance: 2500, credit_amount: 0, debit_amount: 500, date: '14/01/2012' }]
  }
  subject(:printer) { described_class.new }

  describe '#pretty_print' do
    let(:pretty_print) {
      " date || credit || debit || balance \n " \
    "14/01/2012 || 0.00 || 500.00 || 2500.00 \n " \
    "13/01/2012 || 2000.00 || 0.00 || 3000.00 \n " \
    "10/01/2012 || 1000.00 || 0.00 || 1000.00 \n"
    }
    it 'pretty prints all the transactions related to the account' do
      expect { printer.pretty_print(all_transactions) }.to output(pretty_print).to_stdout
    end
  end
end
