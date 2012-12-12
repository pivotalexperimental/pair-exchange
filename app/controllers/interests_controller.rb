class InterestsController < ApplicationController
  def create
    Rails.logger.info('About to create some stuff')
    project = Project.find params[:project_id]
    project.interests.create(:user => current_user)

    redirect_to(projects_path)
  end
end
