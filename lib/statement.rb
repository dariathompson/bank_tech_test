# frozen_string_literal: true

class Statement
  attr_reader :account
  def initialize(account)
    @account = account
  end
end
