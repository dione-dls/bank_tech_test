require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new(0, 1000, 0) }

  describe '#initialize' do
    it 'returns the balance of the account after a transaction has been made' do
      expect(transaction.balance).to eq 0
    end

    it 'returns the amount of the credit transaction' do
      expect(transaction.credit_amount).to eq 1000
    end

    it 'returns the amount of the debit transaction' do
      expect(transaction.debit_amount).to eq 0
    end

    it 'returns the transaction date' do
      expect(transaction.date).to eq Date.today.strftime
    end
  end
end
