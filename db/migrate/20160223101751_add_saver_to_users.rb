class AddSaverToUsers < ActiveRecord::Migration
 def change
    add_column :users, :saver, :boolean
  end
end
