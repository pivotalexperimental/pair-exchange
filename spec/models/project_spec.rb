require 'spec_helper'

describe Project do
  describe '#interest_from?' do
    it 'should return true for interested users' do
      project = FactoryGirl.create :project
      interest = project.interests.create :user => "testUser@example.com"
      project.interest_from?("testUser@example.com").should be_true
    end

    it 'should return false for not interested users' do
      project = FactoryGirl.create :project
      interest = project.interests.create :user => "testUser@example.com"
      project.interest_from?("notInterested@example.com").should be_false
    end
  end
end