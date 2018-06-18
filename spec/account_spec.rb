require 'account'

describe Account do
  subject(:account) { described_class.new }

  describe '#balance' do
    it 'has a default balance of 0' do
      expect(account.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'increases the balance by a specified amount' do
      expect { account.deposit(1000) }.to change { account.balance }.by 1000
    end
  end

  describe '#withdraw' do
    it 'decreases the balance by a specified amount' do
      expect { account.withdraw(500) }.to change { account.balance }.by -500
    end
  end
end
