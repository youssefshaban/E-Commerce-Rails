class Order < ApplicationRecord
    belongs_to :buyer

    has_many :OrderItem
    has_many :Product, through: :OrderItem
end
