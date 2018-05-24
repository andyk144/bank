require_relative 'transaction'
require_relative 'transaction_log'
require_relative 'statement'

class BankAccount
  attr_reader :balance, :transaction_log, :statement

  START_BALANCE = 0

  def initialize(transaction_log = TransactionLog.new, transaction = Transaction, statement = Statement)
    @balance = START_BALANCE
    @transaction_log = transaction_log
    @transaction = transaction
    @statement = statement
  end

  def deposit(amount)
    @balance += amount
    add_transaction(amount, 0)
  end

  def withdraw(amount)
    raise 'Insufficient funds' unless sufficient_funds_available?(amount)
    @balance -= amount
    add_transaction(0, amount)
  end

  def statement
    puts @statement.new(@transaction_log.log).print_transactions
  end

  private

  def add_transaction(credit = '', debit = '')
    transaction_record = @transaction.new(credit, debit, @balance)
    transaction_log.add_transaction(transaction_record)
  end

  def sufficient_funds_available?(amount)
    amount <= balance
  end
end
