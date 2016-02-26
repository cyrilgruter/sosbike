class RepairsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :destroy]
  before_action :set_repair, only: [:show, :edit, :update, :destroy]



  def index
    @repairs = Repair.all
    @markers = Gmaps4rails.build_markers(@repairs) do |repair, marker|
      marker.lat repair.latitude
      marker.lng repair.longitude
    end
  end

  def show
    @repair_coordinates = { latitude: @repair.latitude, longitude: @repair.longitude }
    @markers = Gmaps4rails.build_markers(@repair) do |repair, marker|
      marker.lat repair.latitude
      marker.lng repair.longitude
    end
  end

  def create
    @repair = Repair.new(repair_params)
    @repair.client_id = current_user.id
    # current_user.phone = params[:phone]
    # current_user.save
    if @repair.save
      redirect_to repair_path(@repair)
    else
      render :new
    end
  end

  def new
    @repair = Repair.new
    @current_user = current_user
    @address= params[:address]
    @category= params[:category]
    @client_id= @current_user_id
  end

  def edit

  end

  def update
    @repair.update(repair_params)
    #@saver =
    redirect_to account_path
  end

  def destroy
    @repair.destroy
    redirect_to destroy_user_session_path, method: :delete

  end

private

  def set_repair
    @repair = Repair.find(params[:id])
  end

  def repair_params
    params.require(:repair).permit(:status, :category, :address, :client_id, :saver_id, :photo)
  end

end
