class SessionsController < ActionController::Base
  def create
    if request.env['omniauth.auth']['info']['email'] =~ /.*@pivotallabs\.com/
      session[:logged_in] = true
      session[:email] = request.env['omniauth.auth']['info']['email']
    end

    redirect_to root_path
  end
end
