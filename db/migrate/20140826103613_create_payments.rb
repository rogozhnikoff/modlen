class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :type
      t.string :status
      t.decimal :amount
      t.integer :order_id

      t.timestamps
    end
  end
end
