class AddStartTimeToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :first_starttime, :string
    add_column :bookings, :second_starttime, :string
    add_column :bookings, :third_starttime, :string
  end
end
