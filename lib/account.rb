# frozen_string_literal: true

require_relative 'transaction'
class Account
  attr_reader :balance, :transactions
  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    store_transaction('deposit', amount)
    @balance += amount
  end

  def withdraw(amount)
    store_transaction('withdraw', amount)
    @balance -= amount
  end

  private
  def store_transaction(type, amount)
    @transactions << Transaction.new(type: type, amount: amount)
  end
end
