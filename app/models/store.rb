class Store < ApplicationRecord
    has_many :Product
    belongs_to :Seller
end
