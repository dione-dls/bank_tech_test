require 'account'
require 'transaction_log'
require 'transaction'
require 'printer'

describe 'Making a deposit' do
  it 'user specifies an amount to deposit' do
    account = Account.new
    account.deposit(1000)
    expect(account.balance).to eq 1000
  end
  it 'user makes a deposit below the minimum amount required' do
    account = Account.new
    expect { account.deposit(-100) }.to raise_error RuntimeError
  end
end

describe 'Making a withdrawal' do
  it 'user specifies an amount to withdraw' do
    account = Account.new
    account.deposit(1000)
    account.withdraw(500)
    expect(account.balance).to eq 500
  end
  it 'user makes a withdrawal below the minimum amount required' do
    account = Account.new
    account.deposit(1000)
    expect { account.withdraw(-100) }.to raise_error RuntimeError
  end
  it 'user makes a withdrawal more than the current balance in the account' do
    account = Account.new
    account.deposit(1000)
    expect { account.withdraw(5000) }.to raise_error RuntimeError
  end
end

describe 'Viewing current balance' do
  it 'user checks the balance of the account' do
    account = Account.new
    account.deposit(1000)
    account.deposit(2000)
    account.withdraw(500)
    expect(account.balance).to eq 2500
  end
end

describe 'Printing the statement' do
  let(:pretty_print) {
    " date || credit || debit || balance \n " \
  "14/01/2012 || 0.00 || 500.00 || 2500.00 \n " \
  "13/01/2012 || 2000.00 || 0.00 || 3000.00 \n " \
  "10/01/2012 || 1000.00 || 0.00 || 1000.00 \n"
  }
  it 'user sees all bank account transactions printed on the screen' do
    account = Account.new
    account.deposit(1000, '10/01/2012')
    account.deposit(2000, '13/01/2012')
    account.withdraw(500, '14/01/2012')
    expect { account.statement }.to output(pretty_print).to_stdout
  end
end
