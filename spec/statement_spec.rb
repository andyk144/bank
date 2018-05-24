require 'statement'

describe Statement do
  date = Time.new.strftime('%d-%m-%Y')

  describe '#print_transactions' do
    it 'prints out the transactions with the header' do
      transactions = []
      transactions << double(credit_decimal: "300.00", debit_decimal: "0.00", balance_decimal: "300.00", date: date )
      statement = described_class.new(transactions)
      statement_header = "date || credit || debit || balance"
      statement_text = "#{date} || 300.00 || 0.00 || 300.00"
      expect(statement.print_transactions).to eq([statement_header, statement_text])
    end
  end
end
