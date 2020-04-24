# frozen_string_literal: true

class Statement
  attr_reader :account
  STATEMENT_HEADER = "date || credit || debit || balance\n"
  def initialize(account)
    @account = account
    @current_balance = 0
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
    amount = '%.2f' % transaction.amount
    deposit?(transaction) ? "#{amount} ||" : "|| #{amount}"
  end

  def count_balance(transaction)
    amount = transaction.amount
    '%.2f' % @current_balance += (deposit?(transaction) ? amount : - amount)
  end

  def deposit?(transaction)
    transaction.type == 'deposit'
  end
end
