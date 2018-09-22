class ResidentMoneyController < ApplicationController
  before_filter :set_dong_month, only: [:index, :new]
  before_action :authenticate_user!, only: [:index, :show, :new, :edit, :create, :update]

  def index
    respond_to do |format|
      format.html
    end
  end

  def new
    @resident_money = Resident.get_resident(@select_dong)

    respond_to do |format|
      format.html
    end
  end

  def create

  end

  def edit
    @resident_money = Resident.get_resident_money_by_id(params[:id]).first
  end

  def update
    if params[:money].present? && params[:date].present?
      resident_money = ResidentMoney.find_by_id(params[:id])
      respond_to do |format|
        if resident_money.update_attributes(:money => params[:money], :date => params[:date])
          format.html { redirect_to resident_money_path, notice: '성공적으로 수정되었습니다.' }
        else
          format.html { redirect_to resident_money_path, error: '수정에 실패했습니다. 관리자에게 문의하세요' }
        end
      end
    end
  end

  private

  def set_dong_month
    if params[:select_month].present?
      @month = params[:select_month]
    else
      @month = Date.current.strftime('%m').to_i
    end
  end
end
