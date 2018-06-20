class Account
  attr_reader :balance, :transaction_log, :printer

  BALANCE = 0
  MINIMUM_DEPOSIT = 1
  MINIMUM_WITHDRAWAL = 1

  def initialize(transaction_log = TransactionLog.new, printer = Printer.new)
    @balance = BALANCE
    @transaction_log = transaction_log
    @printer = printer
  end

  def deposit(amount, date=Date.today.strftime)
    raise 'Amount below minimum deposit requirement' if below?(MINIMUM_DEPOSIT, amount)
    @balance += amount
    credit(amount, date)
  end

  def withdraw(amount, date=Date.today.strftime)
    raise 'Insufficient funds' if insufficient_funds?(amount)
    raise 'Amount below minimum withdrawal requirement' if below?(MINIMUM_WITHDRAWAL, amount)
    @balance -= amount
    debit(amount, date)
  end

  def statement
    show
  end

  private

  def insufficient_funds?(amount)
    amount > @balance
  end

  def below?(min, amount)
    amount < min
  end

  def credit(amount, transaction = Transaction, date)
    record = transaction.new(@balance, amount, 0, date)
    @transaction_log.add(record)
  end

  def debit(amount, transaction = Transaction, date)
    record = transaction.new(@balance, 0, amount, date)
    @transaction_log.add(record)
  end

  def show
    @printer.pretty_print(transaction_log)
  end
end
