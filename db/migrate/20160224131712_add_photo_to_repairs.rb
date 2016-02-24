class AddPhotoToRepairs < ActiveRecord::Migration
  def change
    add_column :repairs, :photo, :string
  end
end
