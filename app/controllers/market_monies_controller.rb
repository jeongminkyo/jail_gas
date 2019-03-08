class MarketMoniesController < ApplicationController

  before_action :authenticate_user!

  before_filter :set_month, only: [:index]
  before_filter :set_year, only: [:index]

  before_filter(only: [:index, :find_resident]) do
    redirect_to root_path, flash: { error: '권한이 없습니다' } if current_user.is_user?
  end

  before_filter(only: [:new, :edit, :create, :update, :change_active, :destroy]) do
    redirect_to root_path, flash: { error: '권한이 없습니다' } unless current_user.is_admin?
  end

  def index
    @market_monies = MarketMoney.get_market_money(@year, @month)
    @sum_money = MarketMoney.sum_money(@year, @month).first.sum

    respond_to do |format|
      format.html
    end
  end

  def new
    @markets = Market.active_market

    respond_to do |format|
      format.html
    end
  end

  def create
    fail_create_market = []
    if params[:market_money].present?
      params[:market_money].each do |market_id, value|
        if value[0].present? && value[1].present? && value[2].present? && value[3].present?
          return_value = MarketMoney.where('market_id =? and year =? and month = ?', market_id, value[0], value[1]).first_or_initialize do |market_money|
            market_money.year = value[0]
            market_money.month = value[1]
            market_money.money = value[2]
            market_money.date = value[3]
            market_money.market_id = market_id
          end
          if return_value.id.present? # create 안 된 case
            market = Market.find_by_id(market_id)
            market_hash = {}
            market_hash[:name] = market.name
            market_hash[:dong] = market.dong
            market_hash[:ho] = market.ho
            fail_create_market.push(market_hash)
          end
          return_value.save
        end
      end
    end

    if fail_create_market.empty?
      respond_to do |format|
        format.html { redirect_to market_monies_path(select_month: params[:select_month], select_year: params[:select_year]), notice: '성공적으로 생성했습니다.'}
      end
    else
      respond_to do |format|
        format.html { redirect_to market_monies_path(select_month: params[:select_month], select_year: params[:select_year]), :flash => { :error => fail_create_market }}
      end
    end
  end

  def edit
    @market_money = Market.get_market_money_by_id(params[:id]).first
  end

  def update
    if params[:money].present? && params[:date].present?
      market_money = MarketMoney.find_by_id(params[:id])
      respond_to do |format|
        if market_money.update_attributes(:money => params[:money], :date => params[:date])
          format.html { redirect_to market_monies_path, notice: '성공적으로 수정되었습니다.' }
        else
          format.html { redirect_to market_monies_path, error: '수정에 실패했습니다. 관리자에게 문의하세요' }
        end
      end
    end
  end

  def destroy
    if params[:id].present?
      market_money = MarketMoney.find_by_id(params[:id])
      market_money.destroy

      respond_to do |format|
        format.html { redirect_to market_monies_path, notice: '삭제되었습니다.' }
      end
    end
  end

  def find_market
    @market_monies = []

    if params[:name].present?
      @market_monies = MarketMoney.get_market_money_info(params[:name])
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
