class Api::V1::TicketsController < Api::V1::BaseController

  before_filter :find_project

  def index
    @tickets = @project.tickets.for(current_user)
    respond_with(@tickets)
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end


end
