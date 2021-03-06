class ResidentMoneyController < ApplicationController
  before_action :authenticate_user!
  before_filter :set_month, only: [:index]
  before_filter :set_year, only: [:index]

  before_filter(only: [:index, :find_resident]) do
    unless current_user.is_member? || current_user.is_admin?
      redirect_to root_path, :flash => { :error => '권한이 없습니다' }
    end
  end

  before_filter(only: [:new, :edit, :create, :update, :change_active, :destroy]) do
    unless current_user.is_admin?
      redirect_to root_path, :flash => { :error => '권한이 없습니다' }
    end
  end

  def index
    respond_to do |format|
      format.html
    end
  end

  def new
    @resident_money = Resident.all

    respond_to do |format|
      format.html
    end
  end

  def create
    fail_create_resident = []
    if params[:resident_money].present?
      params[:resident_money].each do |resident_id, value|
        if value[0].present? && value[1].present? && value[2].present? && value[3].present?
          return_value = ResidentMoney.where('resident_id =? and year = ? and month = ?', resident_id, value[0], value[1]).first_or_initialize do |resident_money|
            resident_money.year = value[0]
            resident_money.month = value[1]
            resident_money.money = value[2]
            resident_money.date = value[3]
            resident_money.resident_id = resident_id
          end
          if return_value.id.present? # create 안 된 case
            resident = Resident.find_by_id(resident_id)
            resident_hash = {}
            resident_hash[:name] = resident.name
            resident_hash[:dong] = resident.dong
            resident_hash[:ho] = resident.ho
            fail_create_resident.push(resident_hash)
          end
          return_value.save
        end
      end
    end

    if fail_create_resident.empty?
      respond_to do |format|
        format.html { redirect_to resident_money_path(select_month: params[:select_month], select_year: params[:select_year]), notice: '성공적으로 생성했습니다.'}
      end
    else
      respond_to do |format|
        format.html { redirect_to resident_money_path(select_month: params[:select_month], select_year: params[:select_year]), :flash => { :error => fail_create_resident }}
      end
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
    @month = params[:select_month].present? ? params[:select_month] : Date.current.strftime('%m').to_i
  end

  def set_year
    @year = params[:select_year].present? ? params[:select_year] : @year = Date.current.strftime('%Y').to_i
  end
end
