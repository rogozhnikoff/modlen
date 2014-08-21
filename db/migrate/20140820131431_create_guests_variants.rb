class CreateGuestsVariants < ActiveRecord::Migration
  def change
    create_table :guests_variants, id:false do |t|
      t.integer :guest_id
      t.integer :variant_id
    end
  end
end
