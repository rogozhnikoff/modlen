class AddColsToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :collar_present, :boolean
    add_column :line_items, :skirt_present, :boolean
    add_column :line_items, :sleeves_present, :boolean
  end
end
