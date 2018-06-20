require 'account'

describe 'Printing the statement' do
  let(:pretty_print) {
    " date || credit || debit || balance \n " \
  "14/01/2012 || 0.00 || 500.00 || 2500.00 \n " \
  "13/01/2012 || 2000.00 || 0.00 || 3000.00 \n " \
  "10/01/2012 || 1000.00 || 0.00 || 1000.00 \n"
  }
  it 'allows the user to print the statement after making several transactions' do
    account = Account.new
    account.deposit(1000, '10/01/2012')
    account.deposit(2000, '13/01/2012')
    account.withdraw(500, '14/01/2012')
    expect { account.statement }.to output(pretty_print).to_stdout
  end
end

describe 'Making a deposit' do
end
