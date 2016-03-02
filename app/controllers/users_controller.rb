class UsersController < ApplicationController
  def index
    @savers = User.where(saver: true)
  end

  def show
    @saver = User.find(params[:id])
    @review = Review.new
  end
end
