class BankAccount
  attr_reader :balance, :transaction_log

  def initialize
    @balance = 0
    @transaction_log = ["date || credit || debit || balance"]
  end

  def deposit(amount)
    @balance += amount
    add_deposit(@balance, amount)
  end

  def withdraw(amount)
    raise 'Insufficient funds' unless sufficient_funds_available?(amount)
    @balance -= amount
    add_withdrawal(@balance, amount,)
  end

  def statement
    @transaction_log.each { |entry| entry }
  end

  private

  def sufficient_funds_available?(amount)
    amount <= balance
  end

  def add_deposit(balance, amount)
    date = Time.now.strftime("%d/%m/%Y")
    @transaction_log.push("#{date} || #{amount} || || #{balance}")
  end

  def add_withdrawal(balance, amount)
    date = Time.now.strftime("%d/%m/%Y")
    @transaction_log.push("#{date} || || #{amount} || #{balance}")
  end
end
