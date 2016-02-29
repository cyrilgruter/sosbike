class AddPhoneToRepairs < ActiveRecord::Migration
  def change
    add_column :repairs, :phone, :string
  end
end
