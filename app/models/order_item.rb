class OrderItem < ApplicationRecord
    belongs_to :Order , optional: true
    belongs_to :Product , optional: true 
    belongs_to :Seller , optional: true

end
