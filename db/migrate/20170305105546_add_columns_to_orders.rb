class AddColumnsToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :photo, :string
    add_column :orders, :email, :string
  end
end