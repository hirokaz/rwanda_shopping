class AddAasmStateToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :aasm_state, :string
  end
end
