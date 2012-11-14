class InterestsController < ApplicationController
  def create
    project = Project.find params[:project_id]
    project.interests.create params[:interest]

    redirect_to(projects_path)
  end
end
