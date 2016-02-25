class UsersController < ApplicationController
  def index
  end

  def showsaver
    @user = current_user
    if @user.saver
      @test = "réussi"
    end
  end
end
