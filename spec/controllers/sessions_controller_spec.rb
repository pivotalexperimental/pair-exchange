require 'spec_helper'

describe SessionsController do
  describe "create" do
    it "doesn't log in a non-pivotal user" do
      request.env['omniauth.auth'] = { 'info' => { 'email' => 'anything@square.com' } }
      post :create, :provider => 'google_apps'
      session[:logged_in].should be_nil
    end

    it "sets the session email" do
      request.env['omniauth.auth'] = {
        'info' => {
          'email' => 'anything@pivotallabs.com',
          'name' => 'jpivot'
        }
      }

      post :create, :provider => 'google_apps'
      session[:email].should == 'anything@pivotallabs.com'
    end

    xit "redirects to the homepage" do
      request.env['omniauth.auth'] = {
        'info' => {
          'email' => 'anything@pivotallabs.com',
          'name' => 'jpivot'
        }
      }

      post :create, :provider => 'google_apps'
      response.should redirect_to(root_path)
    end
    
    it 'redirects to the google plus authorization page' do
      request.env['omniauth.auth'] = {
        'info' => {
          'email' => 'anything@pivotallabs.com',
          'name' => 'jpivot'
        }
      }
      post :create, :provider => 'google_apps'
      response.should redirect_to("https://accounts.google.com/o/oauth2/auth?access_type=offline&approval_prompt=force&client_id=962111677531.apps.googleusercontent.com&redirect_uri=http://pair-exchange.herokuapp.com/oauth2callback&response_type=code&scope=https://www.googleapis.com/auth/plus.me")
    end
  end
end
