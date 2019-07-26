class Blog < ApplicationRecord
  is_impressionable :counter_cache => :impressions_count  

  belongs_to :admin_user
  belongs_to :location

  has_one_attached :image

  has_many :blog_hashtags
  has_many :hashtags, -> { distinct },through: :blog_hashtags
  has_many :category_blogs
  has_many :categories, -> { distinct },through: :category_blogs  
  accepts_nested_attributes_for :blog_hashtags, allow_destroy: true
  accepts_nested_attributes_for :category_blogs, allow_destroy: true

  has_many :impressions, as: :impressionable
  validates :title, :short_description, :content, presence: true  
  validates :title, uniqueness: true, length: {maximum: 50}

  scope :popular, -> {order(impressions_count: :DESC).take(3)}

  def self.hashtags_and_location_in_common(blog)
    @hashtags = Array.new
    blog.hashtags.each do |h|
      @hashtags.push(h.id)
    end
    @q = Blog.ransack(:location_province_has_any_term => blog.location.province, :hashtags_id_in => @hashtags, :id_not_eq => blog.id)
    @q.result(distinct: true).order(impressions_count: :DESC).limit(2)
  end
  
end
