class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    unless session[:name]
      @current_user = session[:name]
    end

    @current_user
  end
end
