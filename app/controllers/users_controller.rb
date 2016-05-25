class UsersController < ApplicationController
  # before_action :index

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
