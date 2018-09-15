class ResidentsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :edit, :create, :update, :change_active]
  before_action :set_resident, only: [:show, :edit, :update, :change_active]

  # GET /residents
  # GET /residents.json
  def index
    if params[:select_dong].present?
      @select_dong = params[:select_dong]
    else
      @select_dong = 'A'
    end

    @resident = Resident.where('dong = ? and active = ?',@select_dong, Resident::ACTIVE_USER::ACTIVE)

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
        format.json { render :show, status: :created, location: @resident }
      else
        format.html { render :new }
        format.json { render json: @resident.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /residents/1
  # PATCH/PUT /residents/1.json
  def update
    respond_to do |format|
      if @resident.update(resident_params)
        format.html { redirect_to residents_path, notice: '성공적으로 수정되었습니다.' }
        format.json { render :show, status: :ok, location: @resident }
      else
        format.html { render :edit }
        format.json { render json: @resident.errors, status: :unprocessable_entity }
      end
    end
  end

  def change_active
    respond_to do |format|
      if @resident.update(:active => Resident::ACTIVE_USER::INACTIVE)
        format.html { redirect_to residents_path, notice: '성공적으로 삭제되었습니다.' }
        format.json { render :show, status: :ok, location: @resident }
      else
        format.html { render :edit }
        format.json { render json: @resident.errors, status: :unprocessable_entity }
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
