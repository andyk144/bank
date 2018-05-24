require 'bank'

describe BankAccount do
  subject(:account) { described_class.new }
  let(:statement) { double('statement') }

  before(:each) do
    allow_any_instance_of(BankAccount).to receive(:add_transaction)
  end


  describe '#balance' do
    it 'shows my account balance as 0' do
      expect(account.balance).to eq(0)
    end
  end


  describe '#deposit' do
    it 'allows user to deposit money into an account increasing the balance' do
      account.deposit(100)
      expect(account.balance).to eq(100)
    end
  end

  describe '#withdrawal' do
    it 'allows user to withdraw money from an account' do
      account.deposit(500)
      account.withdraw(150)
      expect(account.balance).to eq(350)
    end
    it 'won\'t allow a user to withdraw more than the balance' do
      account.deposit(500)
      expect { account.withdraw(550) }.to raise_error 'Insufficient funds'
    end
  end

  describe '#statement' do
    before do
      date = Time.now.strftime('%d/%m/%Y')
      allow_any_instance_of(BankAccount).to receive(:statement).and_return(["test"])
    end

    it 'prints the statement' do
      date = Time.now.strftime('%d/%m/%Y')
      message = "test\n"
      # message = "date || credit || debit || balance\n#{date} || 200.00 || 0.00 || 200.00 \n"
      expect { account.statement }.to output(message).to_stdout
    end
  end
end
