class AddDefaultToVariants < ActiveRecord::Migration
  def change
    add_column :variants, :default, :boolean
  end
end
