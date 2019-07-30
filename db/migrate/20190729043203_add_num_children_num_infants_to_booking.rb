class AddNumChildrenNumInfantsToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :numChildren, :integer
    add_column :bookings, :numInfants, :integer
  end
end
