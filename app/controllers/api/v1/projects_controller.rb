class Api::V1::ProjectsController < Api::V1::BaseController

  def show
    @project = Project.find(params[:id])
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

  private

  def project_params
    params.require(:project).permit(:name)
  end


end
