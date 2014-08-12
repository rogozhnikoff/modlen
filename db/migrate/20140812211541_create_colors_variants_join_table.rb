class CreateColorsVariantsJoinTable < ActiveRecord::Migration
  def change
    create_table :colors_variants, id: false do |t|
       t.integer :color_id
       t.integer :variant_id
    end
  end
end
