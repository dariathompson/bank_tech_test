class Transaction
  attr_reader :type
  def initialize(type:, amount:)
    @type = type
  end
end