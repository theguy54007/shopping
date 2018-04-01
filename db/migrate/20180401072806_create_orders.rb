class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :name
      t.string :phone
      t.string :address
      t.string :shipping_status
      t.string :payment_status
      t.integer :amount
      t.integer :sn
      t.timestamps
    end
  end
end
