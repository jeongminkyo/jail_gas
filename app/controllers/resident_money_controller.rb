class ResidentMoneyController < ApplicationController

  def index
    if params[:select_dong].present? && params[:select_month].present?
      @select_dong = params[:select_dong]
      month = params[:select_month]
    else
      @select_dong = 'A'
      month = Date.current.strftime('%m').to_i
    end

    @resident_money = Resident.get_resident_money(month, @select_dong)

    respond_to do |format|
      format.html
    end
  end

  def new

  end

  def create

  end

  def edit

  end

  def udpate

  end
end
