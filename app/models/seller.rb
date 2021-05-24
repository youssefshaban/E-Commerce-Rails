class Seller < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to  :store , optional: true
  has_many :OrderItems
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
