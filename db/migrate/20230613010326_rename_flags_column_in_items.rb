class RenameFlagsColumnInItems < ActiveRecord::Migration[6.1]
  def change
    rename_column :items, :flags,:status
  end
end
