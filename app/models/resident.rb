class Resident < ApplicationRecord

  has_many :resident_money

  module ACTIVE_USER
    ACTIVE = 0
    INACTIVE = 1
  end

  class << self
    def get_resident_money(month, dong)
      Resident.select('resident_moneys.id as id, dong,ho,name, resident_moneys.money, resident_moneys.date')
          .joins('left join resident_moneys on residents.id = resident_moneys.resident_id')
          .where('month =? and dong = ?', month, dong)
    end

    def sum_money(month, dong)
      Resident.select('sum(money) as sum')
          .joins('left join resident_moneys on residents.id = resident_moneys.resident_id')
          .where('month =? and dong = ?', month, dong)
    end

    def get_resident_money_by_id(id)
      Resident.select('resident_moneys.id as id, dong,ho,name, resident_moneys.money, resident_moneys.date')
          .joins('join resident_moneys on residents.id = resident_moneys.resident_id')
          .where('resident_moneys.id = ?', id)
    end

    def get_resident(month)
      Resident.select('residents.id as id,dong,ho,name, resident_moneys.money, resident_moneys.date')
          .joins("left outer join (select * from resident_moneys where month = #{month}) resident_moneys on residents.id = resident_moneys.resident_id")
    end
  end
end
