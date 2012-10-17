require 'spec_helper'

describe 'Listing projects' do
  before do
    Project.create(name: 'My Lovely Project')
  end

  it 'shows a list of added projects on the home page' do
    visit('/')
    page.should have_content('My Lovely Project')
  end
end