class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end

  def login
    @user = User.find_by(username: session_params[:username])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      @error = "Invalid username or password"
      render :new
    end
  end

  def logout
    session.clear
    redirect_to root_path
  end

  private

  def session_params
    params.permit(:username, :password)
  end
end
