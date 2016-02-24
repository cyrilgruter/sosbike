class AddStatusToRepairs < ActiveRecord::Migration
  def change
    add_column :repairs, :status, :string, default: 'draft'
  end
end
