class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login

  helper_method :current_user

  def current_user
    @current_user ||= session[:email]
  end

  helper_method :current_user

  def require_login
    unless session[:email]
      redirect_to("/auth/google_apps")
    end
  end
end
