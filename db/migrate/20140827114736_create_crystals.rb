class CreateCrystals < ActiveRecord::Migration
  def change
    create_table :crystals do |t|
      t.string :name
      t.integer :amount
      t.integer :price

      t.timestamps
    end
  end
end
