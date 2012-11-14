class Project < ActiveRecord::Base
  attr_accessible :name, :owner, :description, :office, :technology, :finished
  has_many :interests

  def interest_from?(user)
    interests.where(:user => user).any?
  end
end