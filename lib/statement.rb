# frozen_string_literal: true
require 'account'
class Statement
  attr_reader :account
  def initialize(account)
    @account = account
  end

  def show
    puts 'date || credit || debit || balance'
    if @account.transactions.length > 0
    puts "#{@account.transactions[0].date} || || #{'%.2f' % @account.transactions[0].amount} || #{'%.2f' % @account.balance}"
    end
  end
end
