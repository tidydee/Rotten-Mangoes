class AfterDeleteMailer < ActionMailer::Base
  default from: "from@example.com"

  def after_delete_mailer(user)
    @user = user
    mail( to: @user.email, subject: "It's Not You, It's Me")
  end
end
