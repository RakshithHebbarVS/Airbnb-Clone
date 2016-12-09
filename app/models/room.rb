class Room < ActiveRecord::Base
	
	mount_uploader :photo, PhotoUploader
	has_many :room_amenity
	has_many :amenities , through: :room_amenity
	has_many :room_type
	has_many :types , through: :room_type
	has_many :bookings
	has_many :wishlists
	belongs_to :city
	belongs_to :location
	belongs_to :user
end
