require 'bank'

describe BankAccount do
  subject(:account) { described_class.new }

  describe '#balance' do
    it 'shows my account balance as 0' do
      expect(account.balance).to eq(0)
    end
  end

  describe '#deposit' do
    it 'allows me to deposit money in to my account which increases the balance' do
      account.deposit(100)
      expect(account.balance).to eq(100)
    end
  end

end
