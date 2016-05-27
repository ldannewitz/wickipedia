class UsersController < ApplicationController

  include ApplicationHelper

  before_filter :redirect_unless_admin, only: [:index]

  def new
    @user = User.new
  end

  def index
    redirect_unless_admin
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
    @edits = @user.edits.reverse
    @comments = @user.comments.reverse
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end

  def promote_to_admin
    User.find(params[:id]).promote
    redirect_to users_path
  end

  def demote_from_admin
    User.find(params[:id]).demote
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
