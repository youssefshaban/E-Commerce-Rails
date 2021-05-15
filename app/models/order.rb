class Order < ApplicationRecord
    belongs_to :buyer , optional: true

    has_many :OrderItems
    has_many :Products, through: :OrderItems
end
