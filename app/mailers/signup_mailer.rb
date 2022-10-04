class SignupMailer < ApplicationMailer
  default from: 'signupnotifications@mock.com'

  def signup_email
    @user = current_user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to mock facebook. Thank you for signing up.')
  end
end
