require 'spec_helper'

describe Interest do
  describe "validations" do
    it "should not allow > 2 interests for one project" do
      project = create(:project)
      2.times { create(:interest, :project => project) }
      interest = build(:interest, :project => project)
      interest.should_not be_valid
      interest.errors[:project].length.should == 1
    end
  end
end