class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login

  def current_user
    unless @current_user
      @current_user = session[:email]
    end

    @current_user
  end
  helper_method :current_user

  def require_login
    unless session[:logged_in]
      redirect_to("/auth/google_apps")
    end
  end
end
