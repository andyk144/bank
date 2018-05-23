require_relative 'bank'

class Transaction
  attr_reader :date

  def initialize(credit, debit, balance)
    @credit1 = credit
    @debit1 = debit
    @balance1 = balance
    @date = Time.now.strftime('%d/%m/%Y')
  end

  def credit
    decimal(credit1)
  end

  def debit
    decimal(debit1)
  end

  def balance
    decimal(balance1)
  end

  private

  attr_reader :credit1, :debit1, :balance1

  def decimal(amount)
    sprintf('%.2f', amount)
  end
end
