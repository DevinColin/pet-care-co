# Preview all emails at http://localhost:3000/rails/mailers/user_notifier_mailer
class UserNotifierMailerPreview < ActionMailer::Preview
  def mailer_view_example
    UserNotifierMailer.send_contact_reply_email("devin@mail.com")
  end
end
