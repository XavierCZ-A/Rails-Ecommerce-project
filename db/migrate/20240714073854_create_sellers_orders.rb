class CreateSellersOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :customer_email, null: false
      t.integer :product_quantity, null: false
      t.decimal :total_price, :precision => 10, :scale => 2, null: false
      t.integer :status, null: false, default: 0
      t.string :shipping_address, null: false
      t.string :customer_name, null: false
      t.string :customer_phone, null: false

      t.timestamps
    end
  end
end
