class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :product_id
      t.string :state
      t.integer :rate
      t.text :review
      t.float :priceAtBuyTime
      t.datetime :acceptedDate
      t.datetime :deliveredDate

      t.timestamps
    end
  end
end
