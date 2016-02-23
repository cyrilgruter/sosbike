class CreateSavers < ActiveRecord::Migration
  def change
    create_table :savers do |t|
      t.references :user, index: true, foreign_key: true
      t.string :average_rating

      t.timestamps null: false
    end
  end
end
