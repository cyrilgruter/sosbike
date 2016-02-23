class RepairsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :destroy]
  before_action :set_repair, only: [:show, :edit, :upadte, :destroy]


  def index
    @repairs = @Repair.all
    @markers = Gmaps4rails.build_markers(@repairs) do |repair, marker|
      marker.lat repair.latitude
      marker.lng repair.longitude
    end
  end

  def show
    @repair = Repair.find(params[:id])
    @repair_coordinates = { latitude: @repair.latitude, longitude: @repair.longitude }
    @alert_message = "You are viewing #{@repair.address}"
    @markers = Gmaps4rails.build_markers(@repair) do |repair, marker|
      marker.lat repair.latitude
      marker.lng repair.longitude
    end

  end

  def create
  end

  def new
    @repair = Repair.new
  end

  def edit
  end

  def update
  end

  def destroy
  end


private

def set_repair
  @repair= Repair.find(params[:id])
end

def repair_params
  params.require(:repair).permit(:address)
end

end
