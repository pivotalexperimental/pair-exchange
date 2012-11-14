class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login

  def current_user
    unless @current_user
      @current_user = session[:name]
    end

    @current_user
  end

  def require_login
    redirect_to("/auth/google_apps")
  end
end
