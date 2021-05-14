class AddStoreIdToSellers < ActiveRecord::Migration[5.2]
  def change
    add_column :sellers, :store_id, :integer
  end
end
