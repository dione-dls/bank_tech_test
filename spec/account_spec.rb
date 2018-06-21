require 'account'

describe Account do
  let(:transaction) { double :transaction }
  let(:transaction_log) { double :transaction_log }
  let(:transaction_1) { double :transaction, balance: 1000, credit: 1000, debit: 0, date: '10/01/2012' }
  let(:transaction_2) { double :transaction, balance: 3000, credit: 2000, debit: 0, date: '13/01/2012' }
  let(:transaction_3) { double :transaction, balance: 2500, credit: 0, debit: 500, date: '14/01/2012' }
  let(:transaction_log_2) { double :transaction_log, all: [transaction_1, transaction_2, transaction_3] }
  let(:printer) { double :printer, pretty_print: transaction_log_2 }
  subject(:account) { described_class.new(transaction_log, printer, transaction) }

  describe '#balance' do
    it 'has a default balance of 0' do
      expect(account.balance).to eq 0
    end
    it 'increases when a deposit is made' do
      allow(transaction).to receive(:new)
      allow(transaction_log).to receive(:add)
      expect { account.deposit(500) }.to change { account.balance }.by 500
    end
    it 'decreases when a withdrawal is made' do
      allow(transaction).to receive(:new)
      allow(transaction_log).to receive(:add)
      account.deposit(500)
      expect { account.withdraw(200) }.to change { account.balance }.by(-200)
    end
  end

  describe '#deposit' do
    it 'increases the balance by a specified amount' do
      allow(transaction).to receive(:new)
      allow(transaction_log).to receive(:add)
      expect { account.deposit(1000) }.to change { account.balance }.by 1000
    end
    it 'raises an error when amount to be deposited is less than minimum deposit requirement' do
      expect { account.deposit(0) }.to raise_error RuntimeError
    end
    it 'creates a record of the deposit and stores it in a transaction log' do
      allow(transaction).to receive(:new)
      allow(transaction_log).to receive(:add)
      account.deposit(1000)
      expect(transaction_log_2.all).to include(transaction_1)
    end
  end

  describe '#withdraw' do
    it 'decreases the balance by a specified amount' do
      allow(transaction).to receive(:new)
      allow(transaction_log).to receive(:add)
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
      allow(transaction).to receive(:new)
      allow(transaction_log).to receive(:add)
      account.deposit(1000)
      account.deposit(2000)
      account.withdraw(500)
      expect(transaction_log_2.all).to include(transaction_1)
      expect(transaction_log_2.all).to include(transaction_2)
      expect(transaction_log_2.all).to include(transaction_3)
    end
  end

  describe '#statement' do
    let(:text) {
      " date || credit || debit || balance \n " \
    "14/01/2012 || 0.00 || 500.00 || 2500.00 \n " \
    "13/01/2012 || 2000.00 || 0.00 || 3000.00 \n " \
    "10/01/2012 || 1000.00 || 0.00 || 1000.00 \n"
    }
    it 'returns all the transactions related to the account' do
      allow(printer).to receive(:pretty_print).with(transaction_log).and_return(text)
    end
  end
end
