class ExperienceController < ApplicationController
  def index
    add_breadcrumb 'Experience', :experience_index_path
    # @experiences = Experience.all.order(updated_at: :DESC).page(params[:page]).per(6)
    @hot_exp = ExperienceService.new.latest

    @search = Experience.ransack(params[:q])
    @categories = CategoryService.new.call
    @locations = LocationService.new.call
    @search.sorts = 'experience_details.title desc' if @search.sorts.empty?
    @experiences = @search.result(distinct: true).order(created_at: :DESC).page(params[:page]).per(6)

    respond_to do |format|
      format.html
      format.json { render json: @experiences }
    end
  end

  def show
    @experience = Experience.find(params[:id])
    @recommends = ExperienceService.new.recommend(@experience)
    @host = AdminUser.find(@experience.admin_user_id)

    # breacrumb
    add_breadcrumb 'Experience', :experience_index_path
    add_breadcrumb @experience.experience_detail.title, :experience_path
  end

  def search
    # CategoryService.new.search
    # render :index
  end 
  def payment
  end

  def complete
  end

end
