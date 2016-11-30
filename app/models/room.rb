class Room < ActiveRecord::Base
	
	belongs_to :city
	belongs_to :location
	belongs_to :space
	has_many :room_type
	has_many :types , through: :room_type
	has_many :room_amenity
	has_many :amenities , through: :room_amenity
	belongs_to :user
	has_many :bookings
	has_many :wishlists
	
	
end
