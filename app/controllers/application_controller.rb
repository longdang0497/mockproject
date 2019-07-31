# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_exp_search_variable
  # breadcrumb root
  before_action :set_i18n_locale_from_params
  protect_from_forgery
  add_breadcrumb I18n.t("breadcrumbs.top"), :top_path

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[fullname email role_id])
  end

  def before_sign_in_path_for(_resource)
    redirect_to top_path if current_admin_user.role_id != '1'
  end

  def access_denied(exception)
    redirect_to top_path, alert: exception.message
  end
  
  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.available_locales.map(&:to_s).include?(params[:locale])
        I18n.locale = params[:locale]
      else
        flash.now[:notice] = "#{params[:locale]} translation not available"
        logger.error flash.now[:notice]
      end
    end
  end
  
  def default_url_options
    { locale: I18n.locale }
  end

  def set_exp_search_variable
    @locations = LocationService.new.call
    @categories = CategoryService.new.call
    @exp_search = Experience.ransack(params[:q])
    @exp_search.sorts = 'title desc' if @exp_search.sorts.empty?
  end
end
