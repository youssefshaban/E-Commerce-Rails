class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :quantity
      t.float :currentPrice
      t.text :description

      t.timestamps
    end
  end
end
