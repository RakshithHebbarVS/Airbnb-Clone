class CreateRoomTypes < ActiveRecord::Migration
  def change
    create_table :room_types do |t|
      t.integer:room_id 
      t.integer:type_id 
      t.timestamps null: false
    end
  end
end
