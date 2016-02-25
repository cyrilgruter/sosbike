class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :problem]

  def home
  end

  def problem
    @address= params[:address]
    @postal_code = params[:postal_code]

    if @postal_code == ""
      flash[:alert] = "Veuillez entrer un code postal"
      render :home
    elsif @postal_code == "75011"

    else
      flash[:alert] = "Désolé, vous devez être dans le 11ème"
      render :home
    end

  end
end
