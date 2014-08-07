class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.string :name
      t.integer :product_id
      t.integer :line_item_id
      t.timestamps
    end
  end
end
