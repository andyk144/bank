require 'bank'

describe BankAccount do

  let(:transaction_log) { double(log: []) }
  let(:transaction_class) { double() }
  let(:statement_class) { double() }
  let(:statement) { double() }

  subject(:account) { described_class.new(transaction_log, transaction_class, statement_class) }

  context 'transactions' do
    before(:each) do
      allow_any_instance_of(BankAccount).to receive(:add_transaction)
    end

    describe '#balance' do
      it 'initializes with a zero balance' do
        expect(account.balance).to eq(0)
      end
    end

    describe '#deposit' do
      it 'allows user to deposit money into an account increasing the balance' do
        expect{ account.deposit(100) }.to change(account, :balance).by(100)
      end
    end

    describe '#withdrawal' do
      it 'allows user to withdraw money from an account' do
        account.deposit(500)
        expect{ account.withdraw(150) }.to change(account, :balance).by(-150)
      end
      it 'won\'t allow a user to withdraw more than the balance' do
        account.deposit(500)
        expect { account.withdraw(550) }.to raise_error 'Insufficient funds'
      end
    end
  end

  describe '#statement' do
    it 'prints the statement' do
      allow(statement_class).to receive(:new).with(transaction_log.log).and_return(statement)
      allow(statement).to receive(:print_transactions).and_return('Testing statement')
      expect { account.statement }.to output("Testing statement\n").to_stdout
    end
  end
end
