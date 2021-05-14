class AddStoreIdToSellers < ActiveRecord::Migration[5.2]
  def change
    add_reference :sellers, :store, foreign_key: true
  end
end
