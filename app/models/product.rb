class Product < ApplicationRecord
    paginates_per 3

    has_many :ProductAttachment
    accepts_nested_attributes_for :ProductAttachment
    
    belongs_to :Store , optional: true

    has_many :CartCarry
    has_many :Cart, through: :CartCarry

    belongs_to :Brand , optional: true
    belongs_to :Category , optional: true


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
        
            Product.where("currentPrice >= ? or currentPrice <= ? ", "#{min}", "#{max}")
        
    end


end
