class AddProductToStocks < ActiveRecord::Migration[7.1]
  def change
    add_reference :stocks, :product, null: false, foreign_key: true
  end
end
