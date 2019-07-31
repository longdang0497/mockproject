class Booking < ApplicationRecord
  belongs_to :experience
  belongs_to :location
end
