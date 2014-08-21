class CreateUsersVariants < ActiveRecord::Migration
  def change
    create_table :users_variants, id: false do |t|
      t.integer :user_id
      t.integer :variant_id
    end
  end
end
