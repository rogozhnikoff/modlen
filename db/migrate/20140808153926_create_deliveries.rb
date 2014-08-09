class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.date :delivery_date
      t.string :deadline
      t.integer :speed
      t.string :full_name
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.string :zip
      t.string :email
      t.string :tel
      t.text :info
      t.boolean :git_box

      t.integer :order_id

      t.timestamps
    end
  end
end
