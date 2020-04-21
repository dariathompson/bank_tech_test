# frozen_string_literal: true

require 'account'
describe Account do
  describe '#initialize' do
    it 'initializes new account with balance 0' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'adds money to account balance' do 
      subject.deposit(300)
      subject.deposit(100)
      expect(subject.balance).to eq 400
    end
  end

  describe '#withdraw' do
    it 'withdraws money from account balance' do 
      subject.deposit(300)
      subject.withdraw(100)
      subject.withdraw(50)
      expect(subject.balance).to eq 150
    end
  end
end
