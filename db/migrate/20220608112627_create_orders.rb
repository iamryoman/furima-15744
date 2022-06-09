class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|

      t.string :postal_code,      null: false
      t.integer :prefecture_id, null: false
      t.string :municipalities, null: false
      t.string :address, null: false
      t.string :building_name
      t.string :telephone_number, null: false

      t.timestamps

    end
  end
end
