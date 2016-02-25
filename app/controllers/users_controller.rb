class UsersController < ApplicationController
  def index
  end

  def showsaver
    @repairs_saver_nil = Repair.where("saver_id IS NULL")
    @user = current_user
    if @user.saver
      @test = "réussi"
    end
  end
  #@user_id =
end
