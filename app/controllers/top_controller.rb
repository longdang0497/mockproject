require 'forecast_io'
class TopController < ApplicationController
  def index
    @popular_blogs = Blog.popular
    @hot_exp = ExperienceService.new.hottest
    @head_exp = ExperienceService.new.latest
    @forecast = ForecastIO.forecast(10.774305, 106.6859997)
    if params[:set_locale]
      redirect_to top_url(locale: params[:set_locale])
    end
  end
end
