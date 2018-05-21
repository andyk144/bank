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

  describe '#statement' do

    it 'gives me the statement headings' do
      statement_msg = "date || credit || debit || balance"
      expect(account.statement).to eq([statement_msg])
    end

    it 'logs a deposit of 500' do
      account.deposit(500)
      date = date = Time.now.strftime("%d/%m/%Y")
      statement_msg = "date || credit || debit || balance", "#{date} || 500 || || 500"
      expect(account.statement).to eq(statement_msg)
    end

    it 'logs a withdrawal of 100' do
      account.deposit(500)
      account.withdraw(100)
      date = date = date = Time.now.strftime("%d/%m/%Y")
      statement_msg = "date || credit || debit || balance", "#{date} || 500 || || 500", "#{date} || || 100 || 400"
      expect(account.statement).to eq(statement_msg)
    end
  end
end
