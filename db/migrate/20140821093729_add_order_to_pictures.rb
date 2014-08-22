class AddOrderToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :order, :integer, default: 0
  end
end
