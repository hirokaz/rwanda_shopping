class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :phone_number
      t.string :address
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
