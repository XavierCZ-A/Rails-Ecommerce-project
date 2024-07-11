class CreateSellersStocks < ActiveRecord::Migration[7.1]
  def change
    create_table :stocks do |t|
      t.integer :quantity

      t.timestamps
    end
  end
end
