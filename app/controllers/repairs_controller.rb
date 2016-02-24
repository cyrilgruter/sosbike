class RepairsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :destroy]



  def index
    @repairs = Repair.all
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
    @booking = Booking.new(booking_params)
    @booking.bike = @bike
    @booking.user = current_user
    if @booking.save
      redirect_to dashboard_path
    else
      render :new
    end
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

  def product_params
    params.require(:repair).permit(:status, :category, :address, :client_id, :saver_id, :photo)
  end

end
