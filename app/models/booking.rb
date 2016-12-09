
class Booking < ActiveRecord::Base
	belongs_to :user
	belongs_to :room
	

    
    validate :is_available, on: :create
    before_create :calculate_total


    


	private
   
	def check_dates
		if self.end_date < self.start_date || self.start_date < Date.today
		 errors.add(:base, "Invalid date selected")
		end
	end

	def is_available
		bookings = Booking.where('room_id = ? AND end_date>= ? ',self.room_id, Date.today )
		bookings.each do |booking|
			if self.start_date >= booking.start_date && self.start_date <= booking.end_date && (booking.status == 'pending' || booking.status == 'confirm') 
				errors.add(:start_date,"Room already booked")
			elsif self.end_date >= booking.start_date && self.end_date <= booking.end_date && (booking.status == 'pending' || booking.status == 'confirm')
				errors.add(:end_date,"Room already booked")
			elsif self.start_date <= booking.start_date && self.end_date >= booking.end_date && (booking.status == 'pending' || booking.status == 'confirm')
				errors.add(:end_date,"Room already booked")				
			end
		end
	end

	def calculate_total
		#binding.pry
		self.total = (self.end_date - self.start_date).to_i * self.room.price * self.people
	end



	

	
end
