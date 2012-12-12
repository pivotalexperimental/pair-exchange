class InterestsController < ApplicationController
  def create
    project = Project.find params[:project_id]
    project.interests.create(:user => current_user)

    redirect_to(projects_path)
  end
end
