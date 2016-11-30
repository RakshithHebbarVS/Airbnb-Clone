class Type < ActiveRecord::Base
	has_many :room_type
	has_many :rooms , through: :room_type
	belongs_to :user
end
