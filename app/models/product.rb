class Product < ApplicationRecord
    has_many :ProductAttachment
    accepts_nested_attributes_for :ProductAttachment
    
    belongs_to :Store , optional: true

    has_many :CartCarry
    has_many :Cart, through: :CartCarry

    belongs_to :Brand , optional: true
    belongs_to :Category , optional: true


    has_many :OrderItems
    has_many :Order, through: :OrderItems
end
