class Product < ApplicationRecord
    has_many :ProductAttachment
    has_one :Store
    accepts_nested_attributes_for :ProductAttachment


    has_many :CartCarry
    has_many :Cart, through: :CartCarry



    has_many :OrderItem
    has_many :Order, through: :OrderItem
end
