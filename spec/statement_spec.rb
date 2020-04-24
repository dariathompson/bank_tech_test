# frozen_string_literal: true

require 'statement'
describe Statement do
  let(:account) { double :account }
  let(:statement) { described_class.new(account) }
  let(:date) { Time.now.strftime('%d/%m/%Y') }
  let(:deposit) { double :transaction, date: date, type: "deposit", amount: 1000 }
  let(:withdrawal) { double :transaction, date: date, type: "withdraw", amount: 300 }
  describe '#initialize' do
    it 'initializes with account' do
      expect(statement.account).to eq account
    end
  end

  describe '#show' do
    context 'no transactions have been made' do
      let(:account) { double :account, transactions: [] }
      it 'prints empty statement' do
        statement_text = "date || credit || debit || balance\n"
        expect { statement.show }.to output(statement_text).to_stdout
      end
    end

    context 'deposit was made' do
      let(:account) { double :account, transactions: [deposit] }
      it 'prints statement with details of transaction' do
        statement_text = "date || credit || debit || balance\n#{date} || 1000.00 || || 1000.00\n"
        expect { statement.show }.to output(statement_text).to_stdout
      end
    end
    context 'deposit and withdrawal were made' do
      let(:account) { double :account, transactions: [deposit, withdrawal] }
      it 'prints statement with details of transactions in reversed order' do
        statement_text = "date || credit || debit || balance\n#{date} || || 300.00 || 700.00\n#{date} || 1000.00 || || 1000.00\n"
        expect { statement.show }.to output(statement_text).to_stdout
      end
    end
  end
end
