class City < ActiveRecord::Base

	belongs_to :country
	has_many :locations
	has_many :rooms
end
