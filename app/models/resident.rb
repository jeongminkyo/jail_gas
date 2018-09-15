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
  end
end
