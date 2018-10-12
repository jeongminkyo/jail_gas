class ResidentMoneyController < ApplicationController
  before_action :authenticate_user!
  before_filter :set_month, only: [:index, :new]

  before_filter(only: [:index, :find_resident]) do
    user = User.find_by_id(current_user.id)
    unless user.is_member? || user.is_admin?
      redirect_to root_path, :flash => { :error => '권한이 없습니다' }
    end
  end

  before_filter(only: [:new, :edit, :create, :update, :change_active]) do
    user = User.find_by_id(current_user.id)
    unless user.is_admin?
      redirect_to root_path, :flash => { :error => '권한이 없습니다' }
    end
  end

  def index
    respond_to do |format|
      format.html
    end
  end

  def new
    @resident_money = Resident.get_resident(@month)

    respond_to do |format|
      format.html
    end
  end

  def create
    success = 0
    if params[:resident_money].present? && params[:select_month].present?
      params[:resident_money].each do |resident_id, value|
        if value[0].present? && value[1].present?
          ResidentMoney.create(money:value[0], date: value[1], resident_id: resident_id, month:params[:select_month])
          success += 1
        end
      end
    end

    respond_to do |format|
      format.html { redirect_to resident_money_path(select_month: params[:select_month]), notice: success.to_s + '건 성공적으로 생성되었습니다.'}
    end
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

  def destroy
    if params[:id].present?
      resident_money = ResidentMoney.find_by_id(params[:id])
      resident_money.destroy

      respond_to do |format|
        format.html { redirect_to resident_money_path, notice: '삭제되었습니다.' }
      end
    end
  end

  def find_resident
    @resident_monies = []

    if params[:name].present?
      @resident_monies = ResidentMoney.get_resident_money_info(params[:name])
    end

    respond_to do |format|
      format.html
    end
  end

  private

  def set_month
    if params[:select_month].present?
      @month = params[:select_month]
    else
      @month = Date.current.strftime('%m').to_i
    end
  end
end
