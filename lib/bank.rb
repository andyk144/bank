require_relative 'transaction'
require_relative 'transaction_log'

class BankAccount
  attr_reader :balance, :transaction_log

  START_BALANCE = 0

  def initialize(transaction_log = TransactionLog.new)
    @balance = START_BALANCE
    @transaction_log = transaction_log
  end

  def deposit(amount)
    @balance += amount
    add_transaction(decimal(amount), '')
  end

  def withdraw(amount)
    raise 'Insufficient funds' unless sufficient_funds_available?(amount)
    @balance -= amount
    add_transaction('', decimal(amount))
  end

  def statement
    puts transaction_log.print_statement
  end

  private

  def add_transaction(credit = '', debit = '')
    transaction_record = Transaction.new(credit, debit, @balance)
    transaction_log.add_transaction(transaction_record)
  end

  def sufficient_funds_available?(amount)
    amount <= balance
  end

  def decimal(amount)
    sprintf('%.2f', amount)
  end
end
