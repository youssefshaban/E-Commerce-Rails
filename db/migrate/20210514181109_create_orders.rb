class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :state
      t.integer :buyer_id

      t.timestamps
    end
  end
end
