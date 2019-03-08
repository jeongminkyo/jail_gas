class MarketMoney < ApplicationRecord
  has_many :markets

  class << self
    def get_market_money(year, month)
      Market.select('market_moneys.id as id, name, market_moneys.money, market_moneys.date')
          .joins('left join market_moneys on markets.id = market_moneys.market_id')
          .where('year = ? and month =?', year, month)
          .order('markets.id')
    end

    def sum_money(year, month)
      self.select('sum(money) as sum')
          .joins('left join markets on markets.id = market_moneys.market_id')
          .where('year = ? and month =?', year, month)
    end

    def get_market_money_info(name)
      self.select('month, money, date, name, year')
          .joins('left join markets on markets.id = market_moneys.market_id')
          .where("name like '%#{name}%'")
          .order('name, year, month')
    end
  end
end
