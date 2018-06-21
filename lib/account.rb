require 'date'

class Account
  attr_reader :balance, :transaction_log

  BALANCE = 0
  MINIMUM_DEPOSIT = 1
  MINIMUM_WITHDRAWAL = 1

  def initialize(transaction_log = TransactionLog.new, printer = Printer.new,
                 transaction = Transaction, date = Date.today.strftime)
    @balance = BALANCE
    @transaction_log = transaction_log
    @printer = printer
    @transaction = transaction
    @date = date
  end

  def deposit(amount, date = @date)
    raise 'Amount is below minimum deposit amount' if below?(MINIMUM_DEPOSIT, amount)
    @balance += amount
    debit_amount = 0
    new_transaction(amount, debit_amount, date)
  end

  def withdraw(amount, date = @date)
    raise 'Insufficient funds' if insufficient_funds?(amount)
    raise 'Amount is below minimum withdrawal amount' if below?(MINIMUM_WITHDRAWAL, amount)
    @balance -= amount
    credit_amount = 0
    new_transaction(credit_amount, amount, date)
  end

  def statement
    @printer.pretty_print(@transaction_log.all)
  end

  private

  def insufficient_funds?(amount)
    amount > @balance
  end

  def below?(min, amount)
    amount < min
  end

  def new_transaction(credit_amount, debit_amount, date)
    record = @transaction.new(@balance, credit_amount, debit_amount, date)
    @transaction_log.add(record)
  end
end
