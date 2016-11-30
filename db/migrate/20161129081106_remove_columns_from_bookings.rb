class RemoveColumnsFromBookings < ActiveRecord::Migration
  def change
  	remove_column :bookings, :confirm
  end
end
