require 'transaction_log'

describe Transaction_log do
  subject(:transaction_log) { described_class.new }
  let(:transaction_double) { double :transaction }

  it 'initialzes with an empty array' do
    expect(transaction_log.log).to eq([])
  end

  describe 'add_transaction' do
    it 'adds a transaction to the log' do
      transaction_log.add_transaction(transaction_double)
      expect(transaction_log.log).to include(transaction_double)
    end
  end
end
