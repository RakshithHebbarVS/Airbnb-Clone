class AddColumnToBookings < ActiveRecord::Migration
  def change
  	add_column :bookings, :total,:float
  end
end
