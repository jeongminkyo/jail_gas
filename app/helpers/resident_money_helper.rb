module ResidentMoneyHelper

  def select_box_month
    hash = {}
    (1..12).map{|h| hash[h.to_s + '월'] = h}
    hash
  end

  def select_box_year
    hash = {}
    ResidentMoney.all.pluck(:year).uniq.map{|h| hash[h.to_s + '년'] = h}
    hash
  end

  def get_resdient(year, month, dong)
    Resident.get_resident_money(year, month, dong)
  end

  def sum_money(year, month, dong)
    Resident.sum_money(year, month, dong).first.sum
  end
end
