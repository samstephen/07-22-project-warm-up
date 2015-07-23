class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def destroy
    get_user
    @user.destroy
    redirect_to users_path
  end

  def show
    get_user
    # Automatically load the view in /views/users/show.html.erb
  end

  # Get the form to edit a user.
  def edit
    get_user
    # Automatically load the view in /views/users/edit.html.erb
  end

  # Processes the edit-user form submission.
  def update
    get_user

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
    enc_pw = BCrypt::Password.create(params["users"]["password"])
    @user = User.new({name: params["users"]["name"], email: params["users"]["email"], password: enc_pw})

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
    params["users"].permit(:name, :email, :password)
  end

  def get_user
    @user = User.find(params[:id])
  end

end
