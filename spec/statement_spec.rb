# frozen_string_literal: true

require 'statement'
describe Statement do
  let(:account) { double :account }
  let(:statement) { Statement.new(account) }
  describe '#initialize' do
    it 'initializes with account' do
      expect(statement.account).to eq account
    end
  end

  describe '#show' do
    it 'prints empty statement if no transactions have been made' do
      expect { statement.show }.to output("date || credit || debit || balance\n").to_stdout
    end
  end
end
