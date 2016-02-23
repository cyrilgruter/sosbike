class RepairsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :destroy]
  Before_action: set_repair, only: [:show, :edit, :upadte, :destroy]


  def index
  end

  def show
    @flat = Repair.find(params[:id])
    @alert_message = "You are viewing #{@repair.address}"
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


Private

def set_repair
  @repair= Repair.find(params[:id])
end

def repair_params
  params.require(:repair).permit(:address)
end

end
