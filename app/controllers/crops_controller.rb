class CropsController < ApplicationController
  before_action :set_crop, only: [:show, :edit, :update, :destroy]
  before_action :set_form_selects, only: [:new, :edit, :create, :update, :destroy]
  before_action :authorize_admin, only: [:new, :edit, :create, :update, :destroy]

  # GET /crops
  # GET /crops.json
  def index
    @crops = Crop.all
  end

  # GET /crops/1
  # GET /crops/1.json
  def show
  end
  
  def select_box
    @crops = Crop.where(farm_id: params[:farm_id])
    @model_name = params['model']
    render layout: false
  end

  # GET /crops/new
  def new
    @crop = Crop.new
  end

  # GET /crops/1/edit
  def edit
  end

  # POST /crops
  # POST /crops.json
  def create
    @crop = Crop.new(crop_params)

    respond_to do |format|
      if @crop.save
        format.html { redirect_to @crop, notice: 'Crop was successfully created.' }
        format.json { render :show, status: :created, location: @crop }
      else
        format.html { render :new }
        format.json { render json: @crop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crops/1
  # PATCH/PUT /crops/1.json
  def update
    respond_to do |format|
      if @crop.update(crop_params)
        format.html { redirect_to @crop, notice: 'Crop was successfully updated.' }
        format.json { render :show, status: :ok, location: @crop }
      else
        format.html { render :edit }
        format.json { render json: @crop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crops/1
  # DELETE /crops/1.json
  def destroy
    @crop.destroy
    respond_to do |format|
      format.html { redirect_to crops_url, notice: 'Crop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crop
      @crop = Crop.find(params[:id])
    end
    
    def set_form_selects
      @farms = current_user.farms
      @seasons = [['Summer', 'Summer'], ['Winter', 'Winter'], ['Rainy', 'Rainy']]
      @merasures = [['acre', 'acre'], ['sqft', 'sqft'], ['sqm', 'sqm'], ['hectare', 'hectare'], ['gunta', 'gunta']]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crop_params
      params.require(:crop).permit(:name, :farm_id, :season, :sowing_date, :harvest_date, :area_covered, 
      :covered_area_measure, :life_span_years, :life_span_months, :life_span_days, :description)
    end
end
