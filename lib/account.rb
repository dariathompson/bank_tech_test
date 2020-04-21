require_relative 'transaction'
class Account
  attr_reader :balance, :transactions
  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @transactions << Transaction.new(type: 'deposit', amount: amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end
