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
end
