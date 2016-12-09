class ChangeColumnTypesRooms < ActiveRecord::Migration
  def change
  	change_column :rooms,:price,:float
  end
end
