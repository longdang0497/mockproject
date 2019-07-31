require 'date'
class Experience < ApplicationRecord
  is_impressionable

  paginates_per 6

  belongs_to :location
  belongs_to :admin_user

  has_one_attached :image
  
  has_many :experience_dates
  has_many :impressions, as: :impressionable
  has_many :category_experiences
  has_many :bookings
  has_many :categories, -> { distinct },through: :category_experiences
  accepts_nested_attributes_for :category_experiences, allow_destroy: true
  validates :title, :price_adult, :price_children, :price_infant, :duration, :age,
            :language, :short_description, :description, presence: true  
  validates :title, uniqueness: true, length: {maximum: 40}


  def available_dates
    @result = []
    @dates = self.experience_dates
    @dates.each do |d| 
      (Date.parse(d.expFrom.to_s)..Date.parse(d.expTo.to_s)).each do |expday|
        @result.push expday.strftime('%Y-%m-%d')
      end
    end
    @result
  end

end
