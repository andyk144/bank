require 'transaction_log'

describe TransactionLog do
  subject(:transaction_log) { described_class.new }
  let(:transaction_double) { double(credit: '500.00', debit: '', balance: 500, date: '21/01/2018') }

  it 'initialzes with an empty array' do
    expect(transaction_log.log).to eq([])
  end

  describe '#add_transaction' do
    it 'adds a transaction to the log' do
      transaction_log.add_transaction(transaction_double)
      expect(transaction_log.log).to include(transaction_double)
    end
  end
end
