class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
    	t.integer  "location_id"
	    t.integer  "city_id"
	    t.string   "description"
	    t.boolean  "is_available"
	    t.integer  "accomodates"
	    t.integer  "bathrooms"
	    t.integer  "bedrooms"
	    t.integer  "beds"
	    t.string   "name"
	    t.float    "price"
	    t.integer  "user_id"
	    t.float    "latitude"
	    t.float    "longitude"
	    t.string   "photo"

      t.timestamps null: false
    end
  end
end
