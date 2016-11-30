class RoomsController < ApplicationController

	before_action :authenticate_user! , except: [:index, :show]
	load_and_authorize_resource
	
	def index
		@rooms = Room.all
	end

	def new
		@room = Room.new
	end

	def create
		@room = Room.new(room_params)
		@room.user_id = current_user.id
		if @room.save
			redirect_to rooms_path , notice: "successfully created room"
		else
			render action: "new"
		end
	end

	def show
			
			@room = Room.find(params[:id])
			@booking = Booking.new
			@wishlist = Wishlist.new

			if params[:booking_id]
				@booking_confirmed = Booking.find(params[:booking_id])
			end

	end

	def edit
		begin
			@room = Room.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			redirect_to rooms_path, notice: "Record Not Found"
    	end
    end

    def update
    	@room = Room.find(params[:id])
    	if @room.update_attributes(room_params)
    		redirect_to room_path(@room),notice: "successfully updated room"
    	else
    		render action: "edit"
    	end
    end

    def destroy
    	@room = Room.find(params[:id])
    	@room.destroy
    	redirect_to room_path, notice: "successfully destroyed"
    end

    private

    def room_params
    	params[:room].permit(:name,:location_id,:city_id,:description,:is_available,:accomodates,:bathrooms,:bedrooms,:beds,:type_ids,:price, amenity_ids: [])
    end


end
