require 'transaction'

describe Transaction do
  subject(:transaction_credit) { described_class.new(500.00, "", 500) }
  subject(:transaction_debit) {described_class.new("", 200.00, 300) }

  it 'records the credit amount' do
    expect(transaction_credit.credit).to eq(500.00)
  end

  it 'records the balance' do
    expect(transaction_credit.balance).to eq(500.00)
  end

  it 'records the debit amount' do
    expect(transaction_debit.debit).to eq(200.00)
  end

  it 'records the transaction date' do
    date = Time.now.strftime("%d/%m/%Y")
    expect(transaction_credit.date).to eq(date)
  end
end
