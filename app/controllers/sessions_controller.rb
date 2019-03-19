class SessionsController < ApplicationController
  def new
  end
  def create
    @user = User.find_by_username(params[:username].downcase) || User.find_by_email(params[:username].downcase)
    if @user && @user.authenticate(params[:password])
      cookies.permanent.signed[:permanent_user_id] = @user.uuid
      session[:user_id] = @user.uuid
      #UserMailer.welcome(@user).deliver_now
      redirect_to root_url, notice: "Logged in!"
    else
      redirect_to root_url, notice: "Error: Username or Password is invalid"
    end
  end
  def destroy
    cookies.permanent.signed[:permanent_user_id] = nil
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
