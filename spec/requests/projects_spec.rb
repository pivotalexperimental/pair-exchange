require 'spec_helper'

describe 'Listing projects' do
  before do
    Project.create(name: 'My Lovely Project')
  end

  it 'shows a list of added projects on the home page' do
    visit('/')
    page.should have_content('My Lovely Project')
  end

  it 'allows you to create a new project' do
    visit('/')
    click_link('Add project')
    fill_in('Name', with: 'My 8th Grade Science Diorama')
    fill_in('Owner', with: 'rob.mee@pivotallabs.com')
    click_button('Create')
    #within('.projects') do
    page.should have_content('My 8th Grade Science Diorama')
    #end
    current_path.should == '/projects'
  end
end