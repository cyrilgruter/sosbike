class RepairsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :destroy]
  before_action :set_repair, only: [:show, :edit, :update, :update_saver,:update_status, :destroy]



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
    @repair.phone = current_user.phone
    if @repair.save
      #to send sms decomment the line below
      send_sms_to_saver
      redirect_to repair_path(@repair)
    else
      render :new
    end
  end

  def new
    @repair = Repair.new
    @current_user = current_user
    @address= params[:address]
    @category= params[:category] || session[:category_before_register]
    @photo = params[:photo]
    @photo_cache = params[:photo_cache]
    @client_id= @current_user_id

  end

  def edit
  end

  def update
    @repair.assign_attributes(repair_params)

    if @repair.phone_changed?
      current_user.phone = @repair.phone
    end

    @repair.save
    current_user.save if current_user.changed?

    redirect_to repair_path(@repair)
  end

  def update_saver
    @repair.saver_id = params[:saver_id]
    @repair.save


    Pusher.trigger("repair-#{@repair.id}", "my_event", {:repair_man => @repair.saver.first_name})
    # this path below if for the saver = when he decide to handle a reparation, the redirect is in the dashboard
    redirect_to account_path
  end

  def update_status
    @repair.status = params[:status]
    @repair.save
    # this path below if for the saver = when he decide to handle a reparation, the redirect is in the dashboard
    redirect_to account_path
  end

  def destroy
    @repair.delete
    # redirect_to destroy_user_session_path, method: :delete

  end

private

  def set_repair
    @repair = Repair.find(params[:id] || params[:repair_id])
  end

  def repair_params
    params.require(:repair).permit(:status, :category, :address, :client_id, :saver_id, :photo, :photo_cache, :phone, :description)
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
      message = @client.account.messages.create(:body => "Une nouvelle requette est créée! Rendez-vous sur www.bikeangles.fr/account",
          :to => phone,     # Replace with your phone number
          :from => "+33756796785")   # Replace with your Twilio number
      puts message.sid
    end
  end

end
