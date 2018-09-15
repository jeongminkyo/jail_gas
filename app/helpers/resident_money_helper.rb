module ResidentMoneyHelper

  def select_box_month
    hash = {}
    (1..12).map{|h| hash[h.to_s + '월'] = h}
    hash
  end
end
