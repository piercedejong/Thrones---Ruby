class SessionsController < ApplicationController
  def new
  end
  def create
    @user = User.find_by(username:params[:username].downcase) || User.find_by(username:params[:username])
    puts @user
    puts params[:username]
    if @user.eql? nil
      puts "EMAIL WAS USED"
      @user =  User.find_by(email:params[:username].downcase)
    end
    puts @user
    if @user and @user.authenticate(params[:password])
      puts "Test123"
      puts @user.username
      puts params[:username]
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
