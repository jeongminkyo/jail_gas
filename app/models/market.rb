class Market < ApplicationRecord

  has_many :market_money

  module ActiveMarket
    ACTIVE = 1
    INACTIVE = 0
  end

  class << self
    def active_market
      where(active: ActiveMarket::ACTIVE)
    end

    def get_market_money_by_id(id)
      self.select('market_moneys.id as id, name, market_moneys.money, market_moneys.date')
          .joins('join market_moneys on markets.id = market_moneys.market_id')
          .where('market_moneys.id = ?', id)
    end
  end
end
