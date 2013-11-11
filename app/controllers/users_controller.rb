class UsersController < ApplicationController

  before_action :get_user, only: [:show,:edit,:update,:destroy]

  def new
    @user = User.new(params[:user])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Profile has been updated."
      redirect_to @user
    else
      flash[:notice] = "User has not been updated."
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have signed up successfully."
      redirect_to projects_path
    else
      render :new
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name,
                                 :password,
                                 :password_confirmation)
  end

  def get_user
    @user = User.find(params[:id])
  end

end
