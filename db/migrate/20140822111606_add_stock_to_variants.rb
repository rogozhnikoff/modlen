class AddStockToVariants < ActiveRecord::Migration
  def change
    add_column :variants, :stock, :string
  end
end
