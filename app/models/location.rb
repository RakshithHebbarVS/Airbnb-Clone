class Location < ActiveRecord::Base

	belongs_to :city
	has_many :rooms
end
