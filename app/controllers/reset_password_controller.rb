class ResetPasswordController < ApplicationController

def index
  @user = User.new
end

def confirmation
  @user = User.find_by(email: user_params[:email], username: user_params[:username])

  if @user
    binding.pry
  end
end


private
def user_params
  params.require(:user).permit(:email, :username)
end
end
