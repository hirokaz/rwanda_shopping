class AddFlagsToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :flags, :integer, default: 0, null: false
  end
end
