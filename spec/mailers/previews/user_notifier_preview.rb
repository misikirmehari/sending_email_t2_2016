# Preview all emails at http://localhost:3000/rails/mailers/user_notifier
class UserNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_notifier/signed_up
  def signed_up
    UserNotifierMailer.signed_up
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_notifier/verified
  def verified
    UserNotifierMailer.verified
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_notifier/verify
  def verify
    UserNotifierMailer.verify
  end

end
