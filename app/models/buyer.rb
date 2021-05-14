class Buyer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :cart
  has_many :order
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
