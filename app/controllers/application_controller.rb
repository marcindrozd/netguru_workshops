class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  def require_admin
    unless current_user.admin?
      redirect_to new_user_session_path
    end
  end

  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :firstname
    devise_parameter_sanitizer.for(:sign_up) << :lastname
  end
end
