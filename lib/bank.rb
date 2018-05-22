require_relative 'transaction'

class BankAccount
  attr_reader :balance

  def initialize()
    @balance = 0
    @transaction_log = ["date || credit || debit || balance"]
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
  end

  def sufficient_funds_available?(amount)
    amount <= balance
  end
end
