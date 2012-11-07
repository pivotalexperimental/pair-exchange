class ProjectsController < ApplicationController
  def index
    @projects = Project.where(:finished => false)
  end

  def new
    @project = Project.new
  end

  def create
    Project.create(params[:project])
    redirect_to(projects_path)
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes(params[:project])
    redirect_to(projects_path)
  end
end