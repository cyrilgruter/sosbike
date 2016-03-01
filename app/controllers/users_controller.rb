class UsersController < ApplicationController
  def index

  end

 #this is the method for the dashboard of the savers
  def showsaver
    @repairs_saver_nil = Repair.where("saver_id IS NULL")
    @user = current_user
    if @user.saver
      @test = "réussi"
    end
  end

  def saver_index
    @savers = User.where(saver: true)
    @review = Review.new
  end
end
