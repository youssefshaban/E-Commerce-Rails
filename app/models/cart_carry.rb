class CartCarry < ApplicationRecord
    belongs_to :Cart , optional: true
    belongs_to :Product , optional: true
end
