class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.integer :accomodates 
      t.integer :bath_rooms 
      t.integer :bed_rooms 
      t.integer :beds 
      t.integer :room_id 

      t.timestamps null: false
    end
  end
end
