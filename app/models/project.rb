class Project < ActiveRecord::Base
  attr_accessible :name, :owner, :description, :office, :technology, :finished
end