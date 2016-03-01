class ChangeReviewReference < ActiveRecord::Migration
  def change
    rename_column :reviews, :repair_id, :user_id
  end
end
