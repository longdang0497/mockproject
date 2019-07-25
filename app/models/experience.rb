class Experience < ApplicationRecord
  is_impressionable

  paginates_per 6

  belongs_to :location
  belongs_to :admin_user

  has_one_attached :image
  
  has_many :experience_dates
  has_many :impressions, as: :impressionable
  has_many :category_experiences
  has_many :categories, through: :category_experiences
end
