class RemoveTableSavers < ActiveRecord::Migration
  def change
    drop_table :savers
  end
end
