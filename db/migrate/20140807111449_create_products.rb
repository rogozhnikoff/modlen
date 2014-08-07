class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :lang
=begin
      add to has many
      types, colors
=end
      t.string :name
      t.integer :price
      t.integer :old_price
      t.text :description
      t.text :short_desc

      t.string :crystal_type
      t.integer :crystal_amount

      t.string :sleeves
      t.string :skirt
      t.string :collar
      t.string :stock_for_sale

      t.string :title
      t.boolean :public


      t.timestamps
    end
  end
end
