class Product < ApplicationRecord
    has_many :ProductAttachment
    accepts_nested_attributes_for :ProductAttachment
    
    belongs_to :Store 

    has_many :CartCarry
    has_many :Cart, through: :CartCarry

    belongs_to :Brand
    belongs_to :Category


    has_many :OrderItems
    has_many :Order, through: :OrderItems
end
