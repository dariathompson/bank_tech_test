# frozen_string_literal: true

require 'account'
describe Account do
  it 'initializes new account with balance 0' do
    expect(subject.balance).to eq 0
  end
end
