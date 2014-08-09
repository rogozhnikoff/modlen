class CreateLineItems < ActiveRecord::Migration
  def change

    create_table :line_items do |t|
      t.string :units
      t.integer :size
      t.integer :age
      t.integer :height
      t.integer :chest
      t.integer :waist
      t.integer :hips
      t.integer :biceps
      t.integer :elbow
      t.integer :wrist
      t.integer :collar
      t.integer :shoulder
      t.integer :neck_circle
      t.integer :from_neck
      t.integer :to_waist
      t.integer :to_skirt
      t.integer :sleeves
      t.integer :skirt
      t.integer :body
      t.string :crystal_type
      t.integer :crystal_amount
      t.text :special_request
      t.string :model_name
      t.decimal :price
      t.integer :product_id
      t.integer :variant_id
      t.integer :order_id

      t.timestamps
    end
  end
end
