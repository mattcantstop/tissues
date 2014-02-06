class Api::V1::ProjectsController < Api::V1::BaseController

  before_filter :find_project, :only => [:show, :update]

  def show
    respond_with(@project, :methods => "last_ticket")
  end

  def index
    respond_with(Project.for(current_user))
  end

  def create
    project = Project.new(project_params)
    if project.save
      respond_with(project, :location => api_v1_project_path(project))
    else
      respond_with(project)
    end
  end

  def update
    @project.update_attributes(project_params)
    respond_with(@project)
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

  private

  def find_project
    @project = Project.for(current_user).find(params[:id])
    rescue ActiveRecord::RecordNotFound
      error = { :error => "The project you were looking for " +
              "could not be found."}
      respond_with(error, :status => 404)
  end

end
