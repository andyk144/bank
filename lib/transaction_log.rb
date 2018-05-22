class TransactionLog
  attr_reader :log

  def initialize
    @log = []
  end

  def add_transaction(record)
    @log.push(record)
  end

  def print_statement
    printable_format
  end

  private

  def printable_format
    map_transactions.unshift(statement_header).each { |each_row| each_row }
  end

  def statement_header
    'date || credit || debit || balance'
  end

  def map_transactions
    @log.map { |trx| "#{trx.date} || #{trx.credit} || #{trx.debit} || #{'%.02f' % trx.balance} " }
  end
end
