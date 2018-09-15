module ResidentsHelper

  def select_box_dong
    hash = {}
    dong = Resident.all.map{|h| p h.dong}.uniq
    dong.map{ |dong| hash[dong.to_s + '동'] = dong }
    hash
  end
end
