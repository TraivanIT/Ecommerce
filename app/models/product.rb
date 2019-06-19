class Product < ApplicationRecord
	belongs_to :moderator
	has_many :order_items
	

	mount_uploader :product_image, ProductUploader
end
