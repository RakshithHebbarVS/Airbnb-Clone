class CreateRoomAmenities < ActiveRecord::Migration
  def change
    create_table :room_amenities do |t|
      t.integer:room_id 
      t.integer:amenity_id 

      t.timestamps null: false
    end
  end
end
