class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])
    # Automatically load the view in /views/users/show.html.erb
  end

  def edit
    @user = User.find(params[:id])
    # Automatically load the view in /views/users/edit.html.erb
  end

  def update
    @user = User.find(params[:id])
  end

  def new
  end

  def create
  end

  private

  def user_params
  end
end
