class OrderItem < ApplicationRecord
	belongs_to :order
	belongs_to :product

	before_save :set_unit_price
	before_save :set_total_price

	def unit_price
		if persisted?
			self[:unit_price]
		else
			product.price
		end
	end

	def total_price
		unit_price * qauntity
	end

	private
		def set_unit_price
			self[:unit_price] = unit_price
		end

		#this method is .....

		def set_total_price
			self[:total_price] = qauntity * set_unit_price 
		end
end
