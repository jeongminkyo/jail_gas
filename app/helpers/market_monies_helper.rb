module MarketMoniesHelper

  def select_box_month
    hash = {}
    (1..12).map{|h| hash[h.to_s + '월'] = h}
    hash
  end

  def select_box_year
    hash = {}
    MarketMoney.all.pluck(:year).uniq.map{|h| hash[h.to_s + '년'] = h}
    hash
  end
end
