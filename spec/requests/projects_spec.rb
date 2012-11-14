require 'spec_helper'

describe 'Listing projects' do
  let(:owner) { 'owner@pivotallabs.com' }

  before do
    Project.create!(name: 'My Lovely Project')
    Project.create!(name: 'My Done Project', finished: true)
    ApplicationController.any_instance.stub(:current_user).
      and_return(owner)
  end

  it 'shows a list of added projects on the home page' do
    visit('/')
    page.should have_content('My Lovely Project')
    page.should_not have_content('My Done Project')
  end

  it 'allows you to create a new project' do
    visit('/')
    click_link('Add project')
    within('#new_project') do
      fill_in('Project Name', with: 'My 8th Grade Science Diorama')
      page.should have_content(owner)
      select('SF', from: 'Office')
      fill_in('Technology', with: 'Cardboard')
      click_button('Create Project')
    end
    page.should have_content('My 8th Grade Science Diorama')
    current_path.should == '/projects'
  end

  it 'allows you to edit a project' do
    visit('/')
    click_link('Edit My Lovely Project')
    fill_in('Description', with: 'Pairing on Starcraft with Dan Hansen')
    click_button('Update Project')
    current_path.should == '/projects'
  end
end