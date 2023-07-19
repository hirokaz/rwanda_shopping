class AddReservedToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :reserved, :boolean, default: false, null: false
  end
end
