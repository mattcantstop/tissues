class Api::V1::TicketsController < Api::V1::BaseController

  before_filter :set_project

  def index
    @tickets = @project.tickets.for(current_user)
    respond_with(@tickets)
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end


end
