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

  private

  def format_transaction
    @account.transactions.map do |transaction|
      "#{transaction.date} || #{format_type(transaction)} || #{count_balance(transaction)}"
    end.reverse.join("\n")
  end

  def format_type(transaction)
    transaction.type == 'deposit' ? "#{'%.2f' % transaction.amount} ||" : "|| #{'%.2f' % transaction.amount}"
  end

  def count_balance(transaction)
    '%.2f' % @balance += (transaction.type == 'deposit' ? transaction.amount : - transaction.amount)
  end
end
