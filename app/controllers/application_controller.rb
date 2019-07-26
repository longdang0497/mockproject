# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # breadcrumb root
  protect_from_forgery
  add_breadcrumb 'Top', :top_path

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

end
