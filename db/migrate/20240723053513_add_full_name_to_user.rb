class AddFullNameToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :full_name, :string, null: false
  end
end
