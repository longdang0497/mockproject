require 'forecast_io'
class TopController < ApplicationController
  def index
    @popular_blogs = Blog.popular
    @hot_exp = ExperienceService.new.hottest

    forecast = ForecastIO.forecast(10.774305, 106.6859997)
    byebug
  end
end
