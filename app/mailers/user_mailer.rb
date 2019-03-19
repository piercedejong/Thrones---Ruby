class UserMailer < ApplicationMailer
  default from: 'wwdeathpool@gmail.com'

  def welcome(user)
    @user = user
    @url = "https://whitewalker.herokuapp.com/"
    mail(to: @user.email, subject: 'Sample Email')
  end
end
