class Transaction_log
  attr_reader :log

  def initialize
    @log = []
  end

  def add_transaction(record)
    @log.push(record)
  end

end
