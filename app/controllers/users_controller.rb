class UsersController < ApplicationController
  def index
    @savers = User.where(saver: true)
  end

  def show
    @saver = User.find(params[:id])
    @review = Review.new
  end

 #this is the method for the dashboard of the savers
  def showsaver
    @repairs_saver_nil = Repair.where("saver_id IS NULL")
    @user = current_user
    if @user.saver
      @test = "réussi"
    end
  end
end
