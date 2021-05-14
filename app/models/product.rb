class Product < ApplicationRecord
    has_many :ProductAttachment
    accepts_nested_attributes_for :ProductAttachment
end
