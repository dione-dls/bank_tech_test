require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new(1000, 1000, 0, '10/01/2012') }

  describe '#initialize' do
    it 'has an attribute that returns the balance of the account after a transaction has been made' do
      expect(transaction.balance).to eq 1000
    end

    it 'has an attribute that returns the amount of the transaction' do
      expect(transaction.credit).to eq 1000
    end

    it 'has an attribute that returns the debit of the transaction' do
      expect(transaction.debit).to eq 0
    end

    it 'has an attribute that returns the transaction date' do
      expect(transaction.date).to eq '10/01/2012'
    end
  end
end
