class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.integer :product_id, null: false
      t.integer :order_id
      t.integer :price
      t.integer :quantity, default: 1
      t.timestamps
    end
  end
end
