class Cart < ApplicationRecord
    belongs_to :buyer

    has_many :CartCarry
    has_many :Product, through: :CartCarry
end
