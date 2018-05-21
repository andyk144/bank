require 'bank'

describe BankAccount do
  subject(:account) { described_class.new }

  describe '#balance' do
    it 'shows my account balance as 0' do
      expect(account.balance).to eq(0)
    end
  end

  describe '#deposit' do
    it 'allows me to deposit money into my account increasing the balance' do
      account.deposit(100)
      expect(account.balance).to eq(100)
    end
  end

  describe '#withdrawal' do
    it 'allows me to withdraw money from my account' do
      account.deposit(500)
      account.withdraw(150)
      expect(account.balance).to eq(350)
    end
    it 'won\'t allow me to withdraw more than my balance' do
      account.deposit(500)
      expect{ account.withdraw(550) }.to raise_error 'Insufficient funds'
    end
  end
end
