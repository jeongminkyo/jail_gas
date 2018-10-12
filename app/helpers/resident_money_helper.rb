module ResidentMoneyHelper

  def select_box_month
    hash = {}
    (1..12).map{|h| hash[h.to_s + '월'] = h}
    hash
  end

  def get_resdient(month, dong)
    Resident.get_resident_money(month, dong)
  end

  def sum_money(month, dong)
    Resident.sum_money(month, dong).first.sum
  end
end
