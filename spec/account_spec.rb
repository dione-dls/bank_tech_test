require 'account'

describe Account do
  let(:transaction_log) { double :transaction_log }
  subject(:account) { described_class.new }

  describe '#balance' do
    it 'has a default balance of 0' do
      expect(account.balance).to eq 0
    end
    it 'increases when a deposit is made' do
      expect { account.deposit(500) }.to change { account.balance }.by 500
    end
    it 'decreases when a withdrawal is made' do
      account.deposit(500)
      expect { account.withdraw(200) }.to change { account.balance }.by(-200)
    end
  end

  describe '#deposit' do
    it 'increases the balance by a specified amount' do
      expect { account.deposit(1000) }.to change { account.balance }.by 1000
    end
    it 'raises an error when amount to be deposited is less than minimum deposit requirement' do
      expect { account.deposit(0) }.to raise_error RuntimeError
    end
    fit 'creates a record of the deposit and stores it in a transaction log' do
      allow(transaction_log).to receive(:add)
      account.deposit(1000)
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
    it 'creates a record of the withdrawal and stores it in a transaction log' do
      account.deposit(1000)
      allow(transaction_log).to receive(:add)
      account.withdraw(500)
    end
  end

  describe '#show' do
    let(:pretty_print) {
      " date || credit || debit || balance \n " \
    "14/01/2012 || 0.00 || 500.00 || 2500.00 \n " \
    "13/01/2012 || 2000.00 || 0.00 || 3000.00 \n " \
    "10/01/2012 || 1000.00 || 0.00 || 1000.00 \n"
    }
    it 'prints out the account statement to the screen' do
      account.deposit(1000, '10/01/2012')
      account.deposit(2000, '13/01/2012')
      account.withdraw(500, '14/01/2012')
      expect { account.statement }.to output(pretty_print).to_stdout
    end
  end
end
