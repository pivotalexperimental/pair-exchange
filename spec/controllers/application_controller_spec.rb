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
      @user = 'Callum'
      session[:name] = @user
    end

    it "should return the current_user" do
      get :index
      assigns(:current_user).should ==(@user)
    end
  end
end