class Seller < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one  :store
  has_many :OrderItems
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
