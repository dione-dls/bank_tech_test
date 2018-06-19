require 'transaction_log'

describe TransactionLog do
  subject(:transaction_log) { described_class.new }
  let(:transaction_1) { double :transaction, balance: 0, amount: 1000, type: 'credit', date: '10/01/2012' }
  let(:transaction_2) { double :transaction, balance: 1000, amount: 2000, type: 'credit', date: '13/01/2012' }
  let(:transaction_3) { double :transaction, balance: 3000, amount: 500, type: 'debit', date: '14/01/2012' }

  describe '#all' do
    it 'is empty by default' do
      expect(transaction_log.all).to be_empty
    end
  end

  describe '#add' do
    it 'records transactions inside the array of all transactions' do
      transaction_log.add(transaction_1)
      transaction_log.add(transaction_2)
      transaction_log.add(transaction_3)
      expect(transaction_log.all).to include transaction_1
      expect(transaction_log.all).to include transaction_2
      expect(transaction_log.all).to include transaction_3
    end
  end
end
