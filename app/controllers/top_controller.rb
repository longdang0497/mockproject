require 'forecast_io'
class TopController < ApplicationController
  def index
    @popular_blogs = Blog.popular
    @hot_exp = ExperienceService.new.hottest
    @categories = CategoryService.new.call
    @locations = LocationService.new.call
    @forecast = ForecastIO.forecast(10.774305, 106.6859997)
    @search = Experience.ransack(params[:q])
  end
end
