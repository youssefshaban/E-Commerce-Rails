class ProductAttachment < ApplicationRecord
    mount_uploader :photo, PhotosUploader
    belongs_to :product
end
