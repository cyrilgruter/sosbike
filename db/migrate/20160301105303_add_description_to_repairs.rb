class AddDescriptionToRepairs < ActiveRecord::Migration
  def change
    add_column :repairs, :description, :string
  end
end
