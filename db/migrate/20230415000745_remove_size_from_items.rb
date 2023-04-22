class RemoveSizeFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :size, :string
  end
end
