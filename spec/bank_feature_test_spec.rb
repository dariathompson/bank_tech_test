# frozen_string_literal: true

describe 'User can print the statement' do
  let(:account) { Account.new }
  let(:date) { Time.now.strftime('%d/%m/%Y') }
  before(:each) do
    account.deposit(500)
  end
  it 'prints statement with details of deposit' do
    statement_text = "date || credit || debit || balance\n#{date} || 500.00 || || 500.00\n"
    expect { account.print_statement }.to output(statement_text).to_stdout
  end
  it 'prints statement with details of transactions in reversed order' do
    account.withdraw(300)
    statement_text = "date || credit || debit || balance\n#{date} || || 300.00 || 200.00\n#{date} || 500.00 || || 500.00\n"
    expect { account.print_statement }.to output(statement_text).to_stdout
  end
end
