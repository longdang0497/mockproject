class Blog < ApplicationRecord
  has_one :blog_detail
  has_one_attached :image

  belongs_to :admin_user
  belongs_to :location

  has_many :blog_hashtags
  has_many :hashtags, through: :blog_hashtags
  
  has_many :category_blogs
  has_many :categories, through: :category_blogs
  is_impressionable :counter_cache => :impressions_count
  has_many :impressions, as: :impressionable
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
