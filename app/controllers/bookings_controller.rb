class BookingsController < ApplicationController
	before_action :authenticate_user! 
	load_and_authorize_resource

	
	def index
		@bookings = Booking.where('user_id=?',current_user.id)
		
		
	end


	def create
			@booking = Booking.new(booking_params)	
			@booking.user_id = current_user.id	
			if  @booking.save
				@booking.update_attributes(status: 'pending')
				redirect_to  room_path(@booking.room_id, booking_id: @booking.id)
			else
				redirect_to room_path(@booking.room_id), notice: "Not available for booking"
			end
		
	end

	def show
		begin
			@booking = Booking.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			redirect_to room_path(@booking.room_id), notice: "Record Not Found"
		end
	end

	def edit
		begin 
			@booking = Booking.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			redirect_to room_path(@booking.room_id), notice: "Record Not Found"
		end
	end

	def update
		@booking = Booking.find(params[:id])
		if @booking.update_attributes(booking_params)
			redirect_to room_path(@booking.room_id),notice: "Successfully updated booking"
		else
			render action: "edit"
		end
	end

	def destroy
		@booking = Booking.find(params[:id])
		@booking.destroy
		redirect_to room_path(@booking.room_id) , notice: "Successfully Destroyed"
	end

	def confirm_booking
		
		booking = Booking.find(params[:booking_id])
		booking.update_attributes(status: 'confirm')
		Notification.booking_confirmed(booking).deliver
		redirect_to room_path(booking.room_id),notice: "Booking Confirmed"
	end

	def cancel_booking
		booking = Booking.find(params[:booking_id])
		booking.update_attributes(status: 'cancel')
		redirect_to room_path(booking.room_id),notice: "Booking Confirmed"
	end
	private

	def booking_params
		params[:booking].permit(:room_id,:user_id,:start_date,:end_date,:people)
	end



end
