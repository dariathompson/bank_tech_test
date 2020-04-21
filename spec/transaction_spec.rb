require 'transaction'
describe Transaction do
  let(:date) { Time.now.strftime('%d/%m/%Y') }
  let(:transaction) { Transaction.new(type: 'deposit', amount: 1000) }
  describe '#initialize' do
    it 'stores type of transaction' do
      expect(transaction.type).to eq 'deposit'
    end
    it 'stores amount of made transaction' do
      expect(transaction.amount).to eq 1000
    end
    it 'stores date when transaction was made' do
      expect(transaction.date).to eq date
    end
  end
end
