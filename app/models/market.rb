class Market < ApplicationRecord

  has_many :market_money

  module ActiveMarket
    ACTIVE = 0
    INACTIVE = 1
  end

  class << self
    def active_market
      where(active: ActiveMarket::ACTIVE)
    end
  end
end
