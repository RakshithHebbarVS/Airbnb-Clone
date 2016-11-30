class AddColumnsToRooms < ActiveRecord::Migration
  def change
  	add_column:rooms, :accomodates,:integer 
  	add_column:rooms, :bathrooms,:integer 
  	add_column:rooms, :bedrooms,:integer   
  	add_column:rooms, :beds,:integer 
  	add_column:rooms, :name,:string  
  end
end
