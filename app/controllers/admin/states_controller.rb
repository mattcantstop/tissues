class Admin::StatesController < ApplicationController

  def index
    @states = State.all
  end

  def new
    @state = State.new
  end

  def create

  end

  private

  def states_params
    
  end

end
