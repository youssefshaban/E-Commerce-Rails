class ProductAttachment < ApplicationRecord
    belongs_to :product
    validates :photo, :product_id, presence: true
    mount_uploader :photo, PhotosUploader
end
