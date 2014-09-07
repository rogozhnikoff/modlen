class CreateDeliveryOptions < ActiveRecord::Migration
  def change
    create_table :delivery_options do |t|
      t.integer :git_box

      t.timestamps
    end
  end
end
