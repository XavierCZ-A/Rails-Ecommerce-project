class RemoveStockFromProducts < ActiveRecord::Migration[7.1]
  def change
    remove_column :products, :stock, :integer
  end
end
