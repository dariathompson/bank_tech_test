# frozen_string_literal: true

require 'statement'
describe Statement do
  let(:account) { Account.new }
  let(:statement) { Statement.new(account) }
  let(:date) { Time.now.strftime('%d/%m/%Y') }
  describe '#initialize' do
    it 'initializes with account' do
      expect(statement.account).to eq account
    end
  end

  describe '#show' do
    context 'no transactions have been made' do
      it 'prints empty statement' do
        statement_text = "date || credit || debit || balance\n"
        expect { statement.show }.to output(statement_text).to_stdout
      end
    end

    context 'deposit was made' do
      it 'prints statement with details of transaction' do
        account.deposit(1000)
        statement_text = "date || credit || debit || balance\n#{date} || 1000.00 || || 1000.00\n"
        expect { statement.show }.to output(statement_text).to_stdout
      end
    end

  end
end
