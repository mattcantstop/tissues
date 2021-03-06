class ProjectsController < ApplicationController

  ###
  # Callbacks
  ###

  before_action :authorize_admin!, except: [:index, :show]
  before_action :require_signin!, only: [:index, :show]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  ###
  # Scopes
  ###

  ###
  # Instance Methods
  ###

  def index
    @projects = Project.for(current_user)
  end

  def new
    @project = Project.new(params[:project])
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
    else
      flash[:alert] = "Project has not been created."
      render "new" 
    end
  end

  def show
    @tickets = @project.tickets
  end

  def edit
  end

  def update
    if @project.update(project_params)
      flash[:notice] = "Project has been updated."
      redirect_to @project
    else
      flash[:notice] = "Project has not been updated."
      render 'edit'
    end
  end

  def destroy
    if @project.delete
      flash[:notice] = "Project has been destroyed."
      redirect_to projects_path
    else
      flash[:notice] = "Project was not destroyed."
      render 'show'
    end
  end

  private
  
  def project_params
    params.require(:project).permit(:name, :description)
  end

  def set_project
    @project = Project.for(current_user).find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The project you were looking for could not be found."
      redirect_to projects_path
  end

end
