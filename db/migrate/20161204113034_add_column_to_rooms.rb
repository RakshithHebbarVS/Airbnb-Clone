class AddColumnToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :rooms, :string
  end
end
