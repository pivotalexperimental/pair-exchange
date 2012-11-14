require 'spec_helper'

describe InterestsController do
  describe 'routing' do
    specify do
      {post: '/projects/1/interests'}.should route_to(controller: 'interests', action: 'create', project_id: '1')
    end
  end

  describe 'create' do
    let(:project) { FactoryGirl.create :project }
    let(:params) do
      {
        project_id: project.id,
        interest: {
          user: 'testUser@example.com',
        }
      }
    end

    it 'creates a new interest with the given params' do
      expect do
        post :create, params
      end.to change(Interest, :count).by(1)
      Interest.last.user.should == 'testUser@example.com'
      Interest.last.project.should == project
    end

    it 'redirects to /' do
      post :create, params
      response.should redirect_to('/projects')
    end
  end
end
