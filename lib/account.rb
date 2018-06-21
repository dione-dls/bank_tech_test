require 'date'

class Account
  attr_reader :balance, :transaction_log, :printer, :transaction

  BALANCE = 0
  MINIMUM_DEPOSIT = 1
  MINIMUM_WITHDRAWAL = 1

  def initialize(transaction_log = TransactionLog.new, printer = Printer.new, transaction = Transaction)
    @balance = BALANCE
    @transaction_log = transaction_log
    @printer = printer
    @transaction = transaction
  end

  def deposit(amount, date = Date.today.strftime)
    raise 'Amount below minimum deposit requirement' if below?(MINIMUM_DEPOSIT, amount)
    @balance += amount
    credit(amount, date)
  end

  def withdraw(amount, date = Date.today.strftime)
    raise 'Insufficient funds' if insufficient_funds?(amount)
    raise 'Amount below minimum withdrawal requirement' if below?(MINIMUM_WITHDRAWAL, amount)
    @balance -= amount
    debit(amount, date)
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

  def credit(amount, date)
    record = @transaction.new(@balance, amount, debit_amt = 0, date)
    transaction_log.add(record)
  end

  def debit(amount, date)
    record = @transaction.new(@balance, credit_amt = 0, amount, date)
    transaction_log.add(record)
  end
end
