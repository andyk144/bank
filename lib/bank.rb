class BankAccount
  attr_reader :balance, :transaction_log

  def initialize
    @balance = 0
    @transaction_log = ["date || credit || debit || balance"]
  end

  def deposit(amount)
    @balance += amount
    add_transaction(@balance, amount)
  end

  def withdraw(amount)
    raise 'Insufficient funds' unless sufficient_funds_available?(amount)
    @balance -= amount
  end

  def statement
    @transaction_log
  end

  private

  def sufficient_funds_available?(amount)
    amount <= balance
  end

  def add_transaction(balance, amount)
    @transaction_log.push("10/01/2012 || #{amount} || || #{balance}")
  end
end
