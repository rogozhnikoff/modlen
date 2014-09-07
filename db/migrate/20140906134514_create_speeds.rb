class CreateSpeeds < ActiveRecord::Migration
  def change
    create_table :speeds do |t|
      t.integer :days
      t.integer :price
      t.integer :delivery_option_id

      t.timestamps
    end
  end
end
