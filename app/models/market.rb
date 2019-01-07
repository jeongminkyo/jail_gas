class Market < ApplicationRecord

  module ACTIVE_MARKET
    ACTIVE = 0
    INACTIVE = 1
  end

  class << self
    def active_market
      where(active: ACTIVE_MARKET::ACTIVE)
    end
  end
end
