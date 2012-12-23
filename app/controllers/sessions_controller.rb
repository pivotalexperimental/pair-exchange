class SessionsController < ActionController::Base
  def create
    if request.env['omniauth.auth']['info']['email'] =~ /.*@pivotallabs\.com/
      session[:email] = request.env['omniauth.auth']['info']['email']
    end
    
    redirect_to "https://accounts.google.com/o/oauth2/auth?access_type=offline&approval_prompt=force&client_id=962111677531.apps.googleusercontent.com&redirect_uri=http://localhost:3000/oauth2callback&response_type=code&scope=https://www.googleapis.com/auth/plus.me"

  end
  
  def update
    session[:code] = params["code"]
    
    redirect_to root_path
  end
end
