class UserMailer < ApplicationMailer
  default from: 'wwdeathpool@gmail.com'

  def welcome(user)
    @user = user
    @url = "https://whitewalker.herokuapp.com/"
    mail(to: @user.email, subject: 'Welcome to the GoT Death Pool')
  end

  def password_reset(user)
    @user = user
    @url = edit_password_reset_url(@user.reset_token, email: @user.email)
    mail(to: @user.email, subject:"Password Reset | GoT Death Pool")
  end

  def update(user)
      @user = user
      mail(to: @user.email, subject:"1 Week To Go | GoT Death Pool")
    end
end
