class AddColtToProduct < ActiveRecord::Migration
  def change
    add_column :products, :sleeves_price, :integer, default: 0
    add_column :products, :skirt_price, :integer, default: 0
    add_column :products, :collar_price, :integer, default: 0
  end
end
