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
    it 'raises an error when amount to be deposited is less than minimum deposit requirement' do
      expect { account.deposit(0) }.to raise_error RuntimeError
    end
  end

  describe '#withdraw' do
    it 'decreases the balance by a specified amount' do
      account.deposit(1000)
      expect { account.withdraw(500) }.to change { account.balance }.by(-500)
    end
    it 'raises an error when amount to be withdrawn is greater than balance' do
      expect { account.withdraw(4000) }.to raise_error RuntimeError
    end
    it 'raises an error when amount to be withdrawn is less than minimum withdrawal amount' do
      expect { account.withdraw(0) }.to raise_error RuntimeError
    end
  end
end
