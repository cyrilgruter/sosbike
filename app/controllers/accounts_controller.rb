class AccountsController < ApplicationController
  def show
    @user = current_user

    if @user.saver
      @repairs_saver_nil = Repair.where(saver_id: nil)
      render 'accounts/show_saver'
    else
      @problems = current_user.problems
      render 'accounts/show_client'
    end
  end
end
