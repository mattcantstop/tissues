class CommentsController < ApplicationController

  before_filter :find_ticket

  def create
    sanitize_parameters!

    @comment = @ticket.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment has been created."
      redirect_to [@ticket.project, @ticket]
    else
      @states = State.all
      flash[:alert] = "Comment has not been created."
      render :template => "tickets/show"
    end
  end

  private

  def sanitize_parameters!
    if cannot?(:"change states", @ticket.project)
      params[:comment].delete(:state_id)
    end
  end

  def find_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def comment_params
    params.require(:comment).permit(:text, :user_id, :ticket_id, :state_id)
  end

end
