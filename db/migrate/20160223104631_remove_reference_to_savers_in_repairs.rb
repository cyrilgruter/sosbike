class RemoveReferenceToSaversInRepairs < ActiveRecord::Migration
  def change
    remove_column :repairs, :saver_id
  end
end
