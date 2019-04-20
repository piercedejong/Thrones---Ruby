class SessionsController < ApplicationController
  def new
  end
  def create
    @user = User.where("lower(username) = ?", params[:username].downcase).first
    if @user and @user.authenticate(params[:password])
      cookies.permanent.signed[:permanent_user_id] = @user.uuid
      session[:user_id] = @user.uuid
      redirect_to root_url, notice: "Logged in!"
    elsif @user and !@user.paid
      redirect_to root_url, notice: "Error: Account was deactivated due no payment"
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
