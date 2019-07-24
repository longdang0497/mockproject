class ExperienceDetail < ApplicationRecord
  belongs_to :experience
  is_impressionable
  has_many :impressions, as: :impressionable
  has_many :experience_dates
  has_one_attached :image
end
