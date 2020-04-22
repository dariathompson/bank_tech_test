# frozen_string_literal: true
require_relative 'account'
class Statement
  attr_reader :account
  def initialize(account)
    @account = account
    @balance = 0
  end

  def show
    puts "date || credit || debit || balance\n" + format_transaction
  end

  def format_transaction
    @account.transactions.map{
      |transaction|
      "#{transaction.date} || #{'%.2f' % transaction.amount} || || #{'%.2f' % @balance += transaction.amount}\n"  
  }.reverse.join("")
  end
end
