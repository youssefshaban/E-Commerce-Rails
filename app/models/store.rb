class Store < ApplicationRecord
    has_many :Product
    has_one :Seller 
end
