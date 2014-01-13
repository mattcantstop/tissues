class Admin::StatesController < ApplicationController

  def index
    @states = State.all
  end

  def new
    @state = State.new
  end

  def create
    @state = State.new(states_params)
    if @state.save
      flash[:notice] = "State has been created."
      redirect_to admin_states_path
    else
      flash[:alert] = "State has not been created."
      render :action => "new"
    end
  end

  private

  def states_params
    params.require(:state).permit(:name)
  end

end
