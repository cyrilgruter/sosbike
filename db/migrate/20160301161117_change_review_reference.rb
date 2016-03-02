class ChangeReviewReference < ActiveRecord::Migration
  def change
    remove_reference :reviews, :repair, index: true
  end
end
