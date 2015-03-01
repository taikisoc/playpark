class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  before_action :configure_permitted_parmitted_parameter, if: :devise_controller?
  def configure_permitted_parmitted_parameter
    devise_parameter_sanitizer.for(:sign_up).push(:fullname, :separate, :avatar)
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def after_sign_out_path_for(resource)
    '/users/sign_in'
  end
  def authenticate_user!
    session[:user_return_to] = env['PATH_INFO']
    redirect_to user_omniauth_authorize_path(:facebook) unless user_signed_in?
  end
end
