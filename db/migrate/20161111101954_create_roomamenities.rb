class CreateRoomamenities < ActiveRecord::Migration
  def change
    create_table :roomamenities do |t|
    	t.string :name

      t.timestamps null: false
    end
  end
end
