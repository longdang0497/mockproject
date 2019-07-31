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
  protected
    def set_i18n_locale_from_params
      I18n.locale = params[:locale] || I18n.default_locale
    end
    def default_url_options
      { locale: I18n.locale }
    end

    def set_exp_search_variable
      @exp_search = Experience.ransack(params[:q])
      @exp_search.sorts = 'title desc' if @exp_search.sorts.empty?
      @locations = LocationService.new.call
      @categories = CategoryService.new.call
    end
end
