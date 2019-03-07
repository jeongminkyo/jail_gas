class ResidentMoney < ApplicationRecord
  has_many :residents

  class << self

    def get_resident_money_info(name)
      self.select('month, money, date, dong,ho,name, year')
          .joins('left join residents on residents.id = resident_moneys.resident_id')
          .where("name like '%#{name}%'")
          .order('dong,ho,name, year, month')
    end
  end
end
