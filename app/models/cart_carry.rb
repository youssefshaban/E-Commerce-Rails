class CartCarry < ApplicationRecord
    belongs_to :Cart
    belongs_to :Product
end
