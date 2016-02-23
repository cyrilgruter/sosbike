class AddReferencesToUsersInRepairs < ActiveRecord::Migration
  def change
    add_column :repairs, :client_id, :integer
    add_column :repairs, :saver_id, :integer
  end
end
