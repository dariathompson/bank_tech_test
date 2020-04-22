# frozen_string_literal: true

require 'statement'
describe Statement do
  let(:account) { double :account }
  let(:statement) { Statement.new(account) }
  let(:date) { Time.now.strftime('%d/%m/%Y') }
  let(:deposit) { double :transaction, date: date, type: 'deposit', amount: 1000}
  describe '#initialize' do
    it 'initializes with account' do
      expect(statement.account).to eq account
    end
  end

  describe '#show' do
    let(:account) { double :account, transactions: [], balance: 0 }
    it 'prints empty statement if no transactions have been made' do
      statement_text = "date || credit || debit || balance\n"
      expect { statement.show }.to output(statement_text).to_stdout
    end

    context 'deposit was made' do
      let(:account) { double :account, transactions: [deposit], balance: 1000 }
      it 'prints statement with details of transaction' do
        statement_text = "date || credit || debit || balance\n#{date} || || 1000.00 || 1000.00\n"
        expect { statement.show }.to output(statement_text).to_stdout
      end
    end

  end
end
