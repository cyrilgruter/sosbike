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
      #to send sms decomment the line below
      #send_sms_to_saver
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
    @photo = params[:photo]
    @photo_cache = params[:photo_cache]
    @client_id= @current_user_id
  end

  def edit

  end

  def update
    @repair.update(repair_params)
    #@saver =
    redirect_to repair_path
  end

  def destroy
    @repair.delete
    # redirect_to destroy_user_session_path, method: :delete

  end

private

  def set_repair
    @repair = Repair.find(params[:id])
  end

  def repair_params
    params.require(:repair).permit(:status, :category, :address, :client_id, :saver_id, :photo, :photo_cache)
  end

  def send_sms_to_saver

    require 'rubygems'
    require 'twilio-ruby'

    # Get your Account Sid and Auth Token from twilio.com/user/account
    account_sid = 'AC8061fb151ba03fdd3e78e5c42fec5f45'
    auth_token = 'f10fd2a4bfde7d1e232b0e029ae4dca2'
    @client = Twilio::REST::Client.new account_sid, auth_token

    savers = {
      "laure" => "+33613026359",
      "matthias" => "+33688833732",
      "cyril" => "+33662549166"
    }

    savers.each do |saver, phone|
      message = @client.account.messages.create(:body => "Une nouvelle requette est créée! Rendez-vous sur le dashboard",
          :to => phone,     # Replace with your phone number
          :from => "+33756796785")   # Replace with your Twilio number
      puts message.sid
    end
  end

end
