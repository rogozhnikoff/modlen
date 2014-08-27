class AddColsToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :status, :string
    add_column :line_items, :colors_additions, :text
  end
end
