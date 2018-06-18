require 'transaction_log'

describe TransactionLog do
  describe '#all' do
    subject(:transaction_log) { described_class.new }

    it 'is empty by default' do
      expect(transaction_log.all).to be_empty
    end

  end
end
