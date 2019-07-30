class ChangeNumOfPeople < ActiveRecord::Migration[5.2]
  def change
    rename_column :bookings, :num_of_people, :numAdults
  end
end
