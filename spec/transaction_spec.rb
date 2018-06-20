require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new('credit', 3000, 2000, '10/01/2012') }

  describe '#initialize' do
    it 'has an attribute that returns the transaction type' do
      expect(transaction.type).to eq 'credit'
    end

    it 'has an attribute that returns the balance of the account after a transaction has been made' do
      expect(transaction.balance).to eq 3000
    end

    it 'has an attribute that returns the amount of the transaction' do
      expect(transaction.amount).to eq 2000
    end

    it 'has an attribute that returns the transaction date' do
      expect(transaction.date).to eq '10/01/2012'
    end
  end

  describe '#classify' do
    it 'returns a credit transaction when transaction type is set to "credit"' do
      expect(transaction.classify[:debit_amount]).to eq 0
    end

    it 'returns a debit transaction when transaction type is set to "debit"' do
      expect(transaction.classify[:credit_amount]).to eq 2000
    end
  end
end
