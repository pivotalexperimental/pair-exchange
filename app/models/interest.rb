class Interest < ActiveRecord::Base
   attr_accessible :user
   belongs_to :project
end
