class RemoveColumnsFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :reserved, :boolean
    remove_column :items, :status, :integer
    #remove_column :items, :sex, :integer
  end
end
