# frozen_string_literal: true

require 'account'
describe Account do
  let(:subject) { Account.new }
  describe '#initialize' do
    it 'initializes new account with balance 0' do
      expect(subject.balance).to eq 0
    end

    it 'initializes with empty transaction history' do
      expect(subject.transactions).to eq []
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

  describe '.transactions' do
    before(:each) do
      subject.deposit(300)
    end
    it 'stores transaction deposit into transaction history' do
      expect(subject.transactions[0].type).to eq 'deposit'
      expect(subject.transactions[0].amount).to eq 300
    end
    it 'stores transaction withdraw into transaction history' do
      subject.withdraw(100)
      expect(subject.transactions[1].type).to eq 'withdraw'
      expect(subject.transactions[1].amount).to eq 100
    end
  end
end
