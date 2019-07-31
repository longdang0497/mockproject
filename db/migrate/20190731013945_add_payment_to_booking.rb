class AddPaymentToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :payment_type, :string
    add_column :bookings, :card_num, :string
    add_column :bookings, :card_firstname, :string
    add_column :bookings, :card_lastname, :string
    add_column :bookings, :card_exp_month, :integer
    add_column :bookings, :card_exp_year, :integer
    add_column :bookings, :security_code, :string
  end
end
