require_relative 'transaction'
require_relative 'transaction_log'

class BankAccount
  attr_reader :balance, :transaction_log, :statement

  START_BALANCE = 0

  def initialize(transaction_log = Transaction_log.new, statement = Statement.new)
    @balance = START_BALANCE
    @transaction_log = transaction_log
    @statement = statement
  end

  def deposit(amount)
    @balance += amount
    add_transaction(amount,"")
  end

  def withdraw(amount)
    raise 'Insufficient funds' unless sufficient_funds_available?(amount)
    @balance -= amount
    add_transaction("", amount)
  end

  def statement
    @transaction_log.each { |entry| entry }
  end

  private

  def add_transaction(credit="", debit="")
    transaction_record = Transaction.new(credit, debit, @balance)
    transaction_log.add_transaction(transaction_record)
  end

  def sufficient_funds_available?(amount)
    amount <= balance
  end
end
