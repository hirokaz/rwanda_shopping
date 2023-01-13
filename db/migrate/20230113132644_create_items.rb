class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :size
      t.text :description
      t.timestamps
    end
  end
end
