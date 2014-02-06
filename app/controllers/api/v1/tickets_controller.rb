class Api::V1::TicketsController < Api::V1::BaseController

  def index
    @tickets = @project.tickets.for(current_user)
    respond_with(@tickets)
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end


end
