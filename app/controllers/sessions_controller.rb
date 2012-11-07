class SessionsController < ApplicationController
  def create
    if request.env['omniauth.auth']['info']['email'] =~ /.*@pivotallabs\.com/
      session[:logged_in] = true
      session[:name] = request.env['omniauth.auth']['info']['name']
    end

    redirect_to root_path
  end
end
