class TopController < ApplicationController
  def index
    @popular_blogs = Blog.popular
    @hot_exp = ExperienceService.new.hottest
  end
end
