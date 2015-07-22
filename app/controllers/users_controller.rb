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

  # Get the form to edit a user.
  def edit
    @user = User.find(params[:id])
    # Automatically load the view in /views/users/edit.html.erb
  end

  # Processes the edit-user form submission.
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to users_path # Redirection needs a request path
    else
      # Rendering needs a specific view template to show.

      # erb :"users/edit" # That's Sinatra though.
      render "edit"
    end
  end

  # Get the form to create a user.
  def new
    @user = User.new
  end

  # Processes the new-user form submission.
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path # Redirection needs a request path
    else
      # Rendering needs a specific view template to show.

      # erb :"users/new" # That's Sinatra though.
      render "new" # "users" folder is assumed.
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end
