class UserNotifier < ActionMailer::Base
  default from: "bounceerr@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.created.subject
  #
  def created(user)
    @user = user
    mail to: user.email, subject: 'Your account has been created.'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.activated.subject
  #
  def activated(user)
    @user = user
    mail to: user.email, subject: 'Your account has been activated.'
  end
end
