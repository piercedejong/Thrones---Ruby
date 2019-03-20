class UserMailer < ApplicationMailer
  default from: 'wwdeathpool@gmail.com'

  def welcome(user)
    @user = user
    @url = "https://whitewalker.herokuapp.com/"
    mail(to: @user.email, subject: 'Welcome to the Death Pool')
  end
end
