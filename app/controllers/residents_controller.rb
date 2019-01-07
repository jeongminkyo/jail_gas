class ResidentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_resident, only: [:show, :edit, :update, :change_active]

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
  # GET /residents
  # GET /residents.json
  def index
    @select_dong = params[:select_dong].present? ? params[:select_dong] : 'A'
    @resident = Resident.active_resident_dong(@select_dong)

    respond_to do |format|
      format.html
    end
  end

  # GET /residents/1
  # GET /residents/1.json
  def show
  end

  # GET /residents/new
  def new
    @resident = Resident.new
  end

  # GET /residents/1/edit
  def edit
  end

  # POST /residents
  # POST /residents.json
  def create
    @resident = Resident.new(resident_params)

    respond_to do |format|
      if @resident.save
        format.html { redirect_to residents_path, notice: '성공적으로 생성되었습니다.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /residents/1
  # PATCH/PUT /residents/1.json
  def update
    respond_to do |format|
      if @resident.update(resident_params)
        format.html { redirect_to residents_path, notice: '성공적으로 수정되었습니다.' }
      else
        format.html { render :edit }
      end
    end
  end

  def change_active
    respond_to do |format|
      if @resident.update(:active => Resident::ActiveUser::INACTIVE)
        format.html { redirect_to residents_path, notice: '성공적으로 삭제되었습니다.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resident
      @resident = Resident.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resident_params
      params.require(:resident).permit(:dong, :ho, :name)
    end
end
