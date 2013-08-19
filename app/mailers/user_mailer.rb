class UserMailer < ActionMailer::Base
  default from: "karen.e.anderson@outlook.com"

def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Lovely Flickr!')
end

end
