require 'printer'

describe Printer do
  let(:transaction_1) { double :transaction, balance: 0, amount: 1000, type: 'credit', date: '10/01/2012'}
  let(:transaction_2) { double :transaction, balance: 1000, amount: 2000, type: 'credit', date: '13/01/2012'}
  let(:transaction_3) { double :transaction, balance: 3000, amount: 500, type: 'debit', date: '14/01/2012'}
  let(:transaction_log) { double :transaction_log, all: [transaction_1, transaction_2, transaction_3]}
  subject(:printer) { described_class.new(transaction_log) }

  describe '#all_transactions' do
    it 'returns the transaction log' do
      expect(printer.all_transactions).to eq transaction_log
    end
  end
end
