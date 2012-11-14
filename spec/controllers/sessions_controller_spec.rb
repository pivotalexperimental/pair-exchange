require 'spec_helper'

describe SessionsController do
  describe "create" do
    it "sets the session[logged_in] to true" do
      request.env['omniauth.auth'] = {'info' => {'email' => 'anything@pivotallabs.com'}}
      post :create, :provider => 'google_apps'
      session[:logged_in].should be_true
    end

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

    it "redirects to the homepage" do
      request.env['omniauth.auth'] = {
        'info' => {
          'email' => 'anything@pivotallabs.com',
          'name' => 'jpivot'
        }
      }

      post :create, :provider => 'google_apps'
      response.should redirect_to(root_path)
    end
  end
end
