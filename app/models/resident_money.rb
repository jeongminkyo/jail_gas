class ResidentMoney < ApplicationRecord
  has_many :residents

  class << self

    def get_resident_money_info(name)
      ResidentMoney.select('month, money, date, dong,ho,name').joins('left join residents on residents.id = resident_moneys.resident_id').where('name = ?', name)
    end
  end
end
