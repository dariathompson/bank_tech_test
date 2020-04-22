# frozen_string_literal: true

class Statement
  attr_reader :account
  def initialize(account)
    @account = account
  end

  def show
    puts 'date || credit || debit || balance'
  end
end
