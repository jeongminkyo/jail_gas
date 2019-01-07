class Resident < ApplicationRecord

  has_many :resident_money

  module ActiveUser
    ACTIVE = 0
    INACTIVE = 1
  end

  class << self
    def get_resident_money(month, dong)
      Resident.select('resident_moneys.id as id, dong,ho,name, resident_moneys.money, resident_moneys.date')
          .joins('left join resident_moneys on residents.id = resident_moneys.resident_id')
          .where('month =? and dong = ?', month, dong)
          .order('residents.id')
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

    def get_resident
      Resident.select('residents.id as id,dong,ho,name, month,resident_moneys.money, resident_moneys.date')
          .joins('left join resident_moneys on residents.id = resident_moneys.resident_id')
          .order('id')
    end

    def active_resident_dong(dong)
      where('dong = ? and active = ?',dong, ActiveUser::ACTIVE)
    end
  end
end
