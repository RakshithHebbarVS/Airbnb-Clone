class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
    	t.integer :location_id 
    	t.integer :city_id
    	t.string  :description
    	t.boolean :is_available

      t.timestamps null: false
    end
  end
end
