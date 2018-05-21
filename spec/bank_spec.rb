require 'bank'

describe BankAccount do
  subject(:account) { described_class.new }

  it 'shows my account balance as 0' do
    expect(account.balance).to eq(0)
  end

end
