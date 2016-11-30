class Space < ActiveRecord::Base
	has_many :rooms
	belongs_to :user
end
