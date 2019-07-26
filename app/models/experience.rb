class Experience < ApplicationRecord
  is_impressionable

  paginates_per 6

  belongs_to :location
  belongs_to :admin_user

  has_one_attached :image
  
  has_many :experience_dates
  has_many :impressions, as: :impressionable
  has_many :category_experiences
  has_many :categories, -> { distinct },through: :category_experiences
  accepts_nested_attributes_for :category_experiences, allow_destroy: true
  validates :title, :price_adult, :price_children, :price_infant, :duration, :age,
            :language, :short_description, :description, presence: true  
  validates :title, uniqueness: true, length: {maximum: 40}

end
