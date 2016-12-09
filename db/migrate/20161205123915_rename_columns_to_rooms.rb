class RenameColumnsToRooms < ActiveRecord::Migration
  def change
  	rename_column :rooms, :rooms, :photo 
  end
end
