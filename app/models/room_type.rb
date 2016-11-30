class RoomType < ActiveRecord::Base
	belongs_to :room
	belongs_to :type
	belongs_to :user
end
