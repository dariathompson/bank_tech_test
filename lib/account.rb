# frozen_string_literal: true

require_relative 'transaction'
require_relative 'statement'
class Account
  attr_reader :balance, :transactions
  def initialize(transaction = Transaction)
    @balance = 0
    @transactions = []
    @statement = Statement.new(self)
    @transaction = transaction
  end

  def deposit(amount)
    store_transaction('deposit', amount)
    @balance += amount
  end

  def withdraw(amount)
    raise 'Your account has insufficient funds.' if amount > @balance

    store_transaction('withdraw', amount)
    @balance -= amount
  end

  def print_statement
    @statement.show
  end

  private

  def store_transaction(type, amount)
    @transactions << @transaction.new(type: type, amount: amount)
  end
end
