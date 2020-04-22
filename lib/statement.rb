# frozen_string_literal: true

require_relative 'account'
class Statement
  attr_reader :account
  STATEMENT_HEADER = "date || credit || debit || balance\n"
  def initialize(account)
    @account = account
    @balance = 0
  end

  def show
    puts STATEMENT_HEADER + format_transaction
  end

  def format_transaction
    @account.transactions.map do |transaction|
      transaction.type == 'deposit' ? transaction_type = "#{'%.2f' % transaction.amount} ||" : transaction_type = "|| #{'%.2f' % transaction.amount}"
      "#{transaction.date} || #{transaction_type} || #{'%.2f' % count_balance(transaction)}\n"
    end.reverse.join('')
  end

  def count_balance(transaction)
    transaction.type == 'deposit' ? @balance += transaction.amount : @balance -= transaction.amount
  end
end
