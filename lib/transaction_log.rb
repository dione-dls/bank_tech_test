class TransactionLog
  attr_reader :all

  def initialize
    @all = []
  end

  def add(transaction)
    @all << transaction
  end
end
