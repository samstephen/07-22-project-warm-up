class UserController < ApplicationController
  def index
    @user = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to user_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end

  private

  def user_params
  end
end
