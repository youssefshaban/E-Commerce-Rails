class AddQuantityToCartCarries < ActiveRecord::Migration[5.2]
  def change
     add_column :cart_carries, :quantity, :integer
  end
end
