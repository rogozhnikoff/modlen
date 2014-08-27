class AddPriceToDelivery < ActiveRecord::Migration
  def change
    add_column :deliveries, :price, :integer
  end
end
