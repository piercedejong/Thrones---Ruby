class PasswordResetsController < ApplicationController
  before_action :get_user,   only: [:edit, :update]
  before_action :check_expiration,   only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email], username: params[:password_reset][:username])

    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
    else
    end
  end

  def edit

  end


  def update
    @user.password = params[:user][:password_new]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      cookies.permanent.signed[:permanent_user_id] = @user.uuid
      session[:user_id] = @user.uuid
      redirect_to root_path
      #format.html { redirect_to edit_user_path(@user.uuid), alert: 'Password Updated' }
    else
      render 'edit'
    end
  end

  private

  def get_user
    @user = User.find_by(email: params[:email])
  end

  def check_expiration
    if @user.password_reset_expired?
      flash[:danger] = "Error: assword reset has expired."
      redirect_to new_password_reset_url
    end
  end
end
