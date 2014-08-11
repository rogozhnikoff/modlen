class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :language
      t.text :description
      t.text :short_desc
      t.string :title
      t.integer :product_id

      t.timestamps
    end
  end
end
