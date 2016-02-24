class PagesController < ApplicationController
  def home
  end

  def problem
    #@adress = params[:adress]
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
