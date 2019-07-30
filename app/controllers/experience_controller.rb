class ExperienceController < ApplicationController
  def index
    add_breadcrumb I18n.t("breadcrumbs.experience"), :experience_index_path, :only => %w(experience)
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

    @exp_dates = ExperienceDate.where(["experience_id = ?", @experience.id])
    gon.expfroms = ExperienceService.new.available_from(@exp_dates)
    gon.exptos = ExperienceService.new.available_to(@exp_dates)
    
    # breacrumb
    add_breadcrumb I18n.t('breadcrumbs.experiences'), :experience_index_path, :only => %w(experiences)
    add_breadcrumb @experience.title, :experience_path
  end

  def search
    if params[:q] && params[:q][:experience_dates_expFrom].present?
      params[:q][:experience_dates_expFrom_gteq_any], params[:q][:experience_dates_expTo_lteq_any] = params[:q][:experience_dates_expFrom].split("-") 
    end
    index
    render :index
  end
  
  def application_form
  end

  def payment
  end

  def complete
    @experience = Experience.find(params[:id])
    @recommends = ExperienceService.new.recommend(@experience)
  end

end
