if Rails.env.test?
  class TestingLoginController < ActionController::Base
    def login
      session[:email] = params[:email]
      render :nothing => true
    end
  end
end