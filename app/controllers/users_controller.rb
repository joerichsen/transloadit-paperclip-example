class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to users_path, :notice => 'User was successfully created'
    else
      render new_user_path
    end
  end

end
