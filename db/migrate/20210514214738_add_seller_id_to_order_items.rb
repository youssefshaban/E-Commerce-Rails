class AddSellerIdToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_items, :seller, foreign_key: true
  end
end
