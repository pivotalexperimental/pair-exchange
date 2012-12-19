require "spec_helper"

describe ApplicationController do
  controller do
    def index
      @current_user = current_user
      render :nothing => true
    end
  end

  describe "#current_user" do
    before :each do
      @user = 'jpivot@pivotallabs.com'
      login(@user)
    end

    it "should return the current_user" do
      get :index
      assigns(:current_user).should ==(@user)
    end
  end

  describe "#require_login" do
    it "should redirect to auth page if no user logged in" do
      get :index
      response.should be_redirect
      response.should redirect_to("/auth/google_apps")
    end
  end
end