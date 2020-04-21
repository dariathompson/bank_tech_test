require 'transaction'
describe Transaction do
  let(:transaction) { Transaction.new(type: "deposit", amount: "1000")}
  describe '#initialize' do
    it 'stores type of transaction' do
      expect(transaction.type).to eq "deposit"
    end
  end
end