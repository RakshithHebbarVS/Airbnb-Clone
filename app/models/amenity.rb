class Amenity < ActiveRecord::Base
	has_many :room_amenity
	has_many :rooms , through: :room_amenity
	belongs_to :user
end

