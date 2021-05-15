class OrderItem < ApplicationRecord
    belongs_to :Order
    belongs_to :Product
    belongs_to :Seller

end
