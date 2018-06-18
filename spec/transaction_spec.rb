require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new(0, 1000, 'credit') }

  describe '#initialize' do
    it 'returns the balance of the account' do
      expect(transaction.balance).to eq 0
    end

    it 'returns the amount of the transaction' do
      expect(transaction.amount).to eq 1000
    end

    it 'returns the type of transaction' do
      expect(transaction.type).to eq 'credit'
    end

    it 'returns the transaction date' do
      expect(transaction.date).to eq Date.today.strftime
    end
  end
end
