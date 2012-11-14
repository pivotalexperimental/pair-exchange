if Rails.env.test?
  class TestingLoginController < ActionController::Base
    def login
      session[:email] = params[:email]
      session[:logged_in] = true

      render :nothing => true
    end
  end
end