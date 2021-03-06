class Product < ActiveRecord::Base
	validates :title, :description, :image_url, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true, length: {minimum: 10, message: 'teapa!!'}
	validates :image_url, allow_blank: true, format: {
				with:
				%r{\.(gif|jpg|png|jpeg)\Z}i,
				message: 'must be a URL for GIF, JPG, JPEG or PNG image.'
				}
	def self.latest
		Product.order(:updated_at).last
	end
end
