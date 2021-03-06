class ReviewsController < ApplicationController
  before_action :set_user

  def create
    @review = Review.new(review_params)
    @review.user = @user

    if @review.save
      respond_to do |format|
        format.html {redirect_to user_path(@user)}
        format.js
      end
    else
      respond_to do |format|
        format.html {render 'users/show'}
        format.js
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
