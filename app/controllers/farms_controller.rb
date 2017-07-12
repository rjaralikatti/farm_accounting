class FarmsController < ApplicationController
  before_action :set_farm, only: [:show, :edit, :update, :destroy]
  before_action :authorize_owner, only: [:new, :edit, :create, :update, :destroy]
  
  def home
    @farms = current_user.farms
  end
  
  # GET /farms
  def index
    @farms = current_user.farms
  end

  # GET /farms/1
  def show
  end

  # GET /farms/new
  def new
    @farm = Farm.new
  end

  # GET /farms/1/edit
  def edit
  end

  # POST /farms
  def create
    @farm = Farm.new(farm_params)

    if @farm.save
      FarmUser.create(farm_id: @farm.id, user_id: current_user.id)
      redirect_to @farm, notice: 'Farm was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /farms/1
  def update
    if @farm.update(farm_params)
      redirect_to @farm, notice: 'Farm was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /farms/1
  # def destroy
  #   @farm.destroy
  #   redirect_to farms_url, notice: 'Farm was successfully destroyed.'
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_farm
      @farm = Farm.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def farm_params
      params.require(:farm).permit(:name, :address, :city, :state, :country)
    end
end
