require_relative 'transaction'

class Statement
  attr_reader :print_output

  def initialize(transaction_log)
    @transaction_log = transaction_log
    @print_output = []
  end

  def print_transactions
    print_output << header
    print_output << map_transactions
    print_output.flatten
  end

  private

  def header
    'date || credit || debit || balance'
  end

  def map_transactions
    @transaction_log.map { |transaction| "#{transaction.date} || #{transaction.credit_decimal} || #{transaction.debit_decimal} || #{transaction.balance_decimal}"}.reverse
  end
end
