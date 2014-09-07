class CreateDeadlineSewings < ActiveRecord::Migration
  def change
    create_table :deadline_sewings do |t|
      t.string :deadline
      t.integer :price
      t.integer :delivery_option_id

      t.timestamps
    end
  end
end
