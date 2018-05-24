class Transaction
  attr_reader :date

  def initialize(credit, debit, balance)
    @credit = credit
    @debit = debit
    @balance = balance
    @date = Time.now.strftime('%d/%m/%Y')
  end

  def credit_decimal
    decimal(credit)
  end

  def debit_decimal
    decimal(debit)
  end

  def balance_decimal
    decimal(balance)
  end

  private

  attr_reader :credit, :debit, :balance

  def decimal(amount)
    sprintf('%.2f', amount)
  end
end
