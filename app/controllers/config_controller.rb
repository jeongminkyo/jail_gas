class ConfigController < ApplicationController
  before_action :authenticate_user!
  before_filter(only: [:index]) do
    user = User.find_by_id(current_user.id)
    unless user.is_member? || user.is_admin?
      redirect_to root_path, :flash => { :error => '권한이 없습니다' }
    end
  end

  before_filter(only: [:edit, :update]) do
    user = User.find_by_id(current_user.id)
    unless user.is_admin?
      redirect_to root_path, :flash => { :error => '권한이 없습니다' }
    end
  end

  def index
    @config = Config.all
    respond_to do |format|
      format.html
      end
  end

  def edit
    @config = Config.all
    authorize_action_for @config
  end

  def update
    @config = Config.all
    cost = Array.new
    cost.push(params[:gas_10kg])
    cost.push(params[:gas_20kg])
    cost.push(params[:gas_50kg])
    cost.push(params[:air])
    cost.push(params[:butane])
    cost.push(params[:argon])
    cost.push(params[:share])
    cost.push(params[:per_money])

    begin
    (1..8).each do |n|
      index = n.to_i
      config = Config.find_by_id(index)
      config.update_attributes!(:cost => cost[index-1])
    end
    respond_to do |format|
      format.html { redirect_to '/configs', notice: '설정이 성공적으로 수정되었습니다.' }
    end

    rescue
      respond_to do |format|
      format.html { redirect_to :back,  :flash => { :error => '오류가 발생했습니다.' } }
      end
    end
  end
end
