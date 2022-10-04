class SignupMailer < ApplicationMailer
  default from: 'signupnotifications@mock.com'

  def signup_email(user)
    @user = user
    @url  = root_url
    mail(to: @user.email, subject: "Welcome to mock facebook, #{@user.first_name}.")
  end
end
