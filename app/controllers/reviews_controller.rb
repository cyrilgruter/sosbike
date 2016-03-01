class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @user = User.find(params[:user_id])
    @review = Review.new(review_params)
    @review.user = @user
    if @review.save
      #redirect_to restaurant_path(@restaurant)
    else
      #render 'restaurants/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
