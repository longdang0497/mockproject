require 'date'
class ExperienceController < ApplicationController
  def index
    add_breadcrumb 'Experience', :experience_index_path
    # @experiences = Experience.all.order(updated_at: :DESC).page(params[:page]).per(6)
    @hot_exp = ExperienceService.new.latest

    @search = Experience.ransack(params[:q])
    @categories = CategoryService.new.call
    @locations = LocationService.new.call
    @search.sorts = 'title desc' if @search.sorts.empty?
    @experiences = @search.result(distinct: true).order(created_at: :DESC).page(params[:page]).per(6)
    @page = params[:page].to_i
    respond_to do |format|
      format.html
      format.json { render json: @experiences }
    end
  end

  def show
    @experience = Experience.find(params[:id])
    @recommends = ExperienceService.new.recommend(@experience)
    @host = AdminUser.find(@experience.admin_user_id)

    load_availableDates

    # breacrumb
    add_breadcrumb 'Experience', :experience_index_path
    add_breadcrumb @experience.title, :experience_path
  end


  def search
    if params[:q] && params[:q][:experience_dates_expFrom].present?
      params[:q][:experience_dates_expFrom_gteq_any], params[:q][:experience_dates_expFrom_lteq_any] = params[:q][:experience_dates_expFrom].split("-") 
    end
    index
    render :index
  end
  
  def application_form
    @experience = Experience.find(params[:id])
    @dates = @experience.available_dates
  end

  def payment
  end

  def complete
    @experience = Experience.find(params[:id])
    @recommends = ExperienceService.new.recommend(@experience)
  end

  private 
  def load_availableDates
    @exp_dates = ExperienceDate.where(["experience_id = ?", @experience.id])
    @mergeddates = ExperienceService.new.available_dates(@exp_dates)
    gon.avalailabledates = @mergeddates
  end

end
