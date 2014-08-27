class AddColsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :collar_present, :boolean
    add_column :products, :skirt_present, :boolean
    add_column :products, :sleeves_present, :boolean
  end
end
