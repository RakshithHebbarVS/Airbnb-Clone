class AddColumnsToBookings < ActiveRecord::Migration
  def change
  	add_column :bookings, :people,:integer
  end
end
