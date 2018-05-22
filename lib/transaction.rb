require_relative 'bank'

class Transaction
  attr_reader :balance, :credit, :debit, :date

  def initialize(credit, debit, balance)
    @credit = credit
    @debit = debit
    @balance = balance
    @date = date = Time.now.strftime("%d/%m/%Y")
  end


end
