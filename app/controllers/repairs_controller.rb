class RepairsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :destroy]



  def index
  end

  def show
  end

  def create
    @repair = Repair.new(repair_params)
    @repair.user = current_user
    if @repair.save
      redirect_to root_path
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
end
