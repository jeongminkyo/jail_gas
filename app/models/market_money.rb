class MarketMoney < ApplicationRecord
  has_many :markets

  class << self
    def get_market_money(month)
      Market.select('market_moneys.id as id, name, market_moneys.money, market_moneys.date')
          .joins('left join market_moneys on markets.id = market_moneys.market_id')
          .where('month =?', month)
          .order('markets.id')
    end
  end
end
