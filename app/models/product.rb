class Product < ApplicationRecord
    validates :name, presence: true
    validates :quantity, presence: true
    validates :currentPrice, presence: true
    validates :description, presence: true

    paginates_per 3

    has_many :ProductAttachment, dependent: :destroy
    accepts_nested_attributes_for :ProductAttachment #, reject_if: proc { |attributes| attributes['photos'].blank? }

    
    belongs_to :store 

    has_many :CartCarry
    has_many :Cart, through: :CartCarry

    belongs_to :brand 
    belongs_to :category 

    
    has_many :OrderItems
    has_many :Order, through: :OrderItems




    def self.search(search)
        if search
            Product.where("name LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
        else
          Product.all
        end
    end


    
    def self.cat(search)
        if search
            Product.where("category_id = ?", "#{search}")
        else
          Product.all
        end
    end



    def self.brand(search)
        if search
            Product.where("brand_id = ? ", "#{search}")
        else
          Product.all
        end
    end


    def self.seller(search)
        if search
            Product.where("store_id = ?", "#{search}")
        else
          Product.all
        end
    end




    def self.price(min,max)
        
            Product.where(currentPrice: min..max)
        
    end


end
