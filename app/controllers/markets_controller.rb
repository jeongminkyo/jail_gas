class MarketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_market, only: [:show, :edit, :update, :change_active]

  before_filter(only: [:index, :show]) do
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
    @market = Market.active_market

    respond_to do |format|
      format.html
    end
  end

  def new
    @market = Market.new
  end

  def edit
  end

  # POST /residents
  # POST /residents.json
  def create
    @market = Market.new(market_params)

    respond_to do |format|
      if @market.save
        format.html { redirect_to markets_path, notice: '성공적으로 생성되었습니다.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /residents/1
  # PATCH/PUT /residents/1.json
  def update
    respond_to do |format|
      if @market.update(market_params)
        format.html { redirect_to markets_path, notice: '성공적으로 수정되었습니다.' }
      else
        format.html { render :edit }
      end
    end
  end

  def change_active
    respond_to do |format|
      if @market.update(active: Market::ACTIVE_MARKET::INACTIVE)
        format.html { redirect_to residents_path, notice: '성공적으로 삭제되었습니다.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_market
    @market = Market.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def market_params
    params.require(:market).permit(:name)
  end
end
