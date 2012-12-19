class Interest < ActiveRecord::Base
   attr_accessible :user
   belongs_to :project

   validate :does_not_have_too_many_interests

  private

  def does_not_have_too_many_interests
    if Interest.where(:project_id => self.project_id).count >= 2
      errors.add(:project, "already has interest from two users!")
    end
  end
end
