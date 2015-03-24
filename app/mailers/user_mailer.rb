class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @url = 'https://secure-mountain-7773.herokuapp.com/'
    mail(to: @user.email, subject: "Welcome to Kyle's Pinterest App")
  end
end
