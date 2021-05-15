class Category < ApplicationRecord
    has_many :Product
    validates :name, presence: true, uniqueness: true
end
