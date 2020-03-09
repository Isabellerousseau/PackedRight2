# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
    #new
    user = User.first
    #old
    # UserMailer.welcome
    UserMailer.with(user: user).welcome
  end

end
