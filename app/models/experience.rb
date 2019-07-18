class Experience < ApplicationRecord
  has_one :experience_detail

  belongs_to :location
  
  has_many :category_experiences
  has_many :categories, through: :category_experiences
  # is_impressionable :counter_cache => :impressions_count
  # has_many :impressions, as: :impressionable

end
