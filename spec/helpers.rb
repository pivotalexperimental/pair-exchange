def login(email)
  session[:email] = email
  session[:logged_in] = true
end