require 'spec_helper'

describe ProjectsController do
  describe 'routing' do
    specify do
      {get: '/projects'}.should route_to(controller: 'projects', action: 'index')
    end
  end

  describe '#index' do
    before do
      Project.create(name: 'The Alan Parsons Project')
      Project.create(name: 'Projecting Fear')
      Project.create(name: 'Astral Projection')
      Project.create(name: 'A project')
    end

    it 'assigns all the Projects' do
      get :index
      assigns(:projects).should == Project.all
    end
  end
end