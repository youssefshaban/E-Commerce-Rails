class Order < ApplicationRecord
    belongs_to :buyer

    has_many :OrderItems
    has_many :Products, through: :OrderItems
end
