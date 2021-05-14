class Product < ApplicationRecord
    has_many :ProductAttachment
    has_one :Store
    accepts_nested_attributes_for :ProductAttachment
end
