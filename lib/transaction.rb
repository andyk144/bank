require_relative 'bank'

class Transaction
  attr_reader :balance, :credit, :debit, :amount

  def initialize(balance, credit, debit)
    @balance = balance
    @credit = credit
    @debit = debit
    @date = date = Time.now.strftime("%d/%m/%Y")
  end


end
