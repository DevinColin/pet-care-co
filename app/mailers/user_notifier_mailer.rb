class UserNotifierMailer < ApplicationMailer

  default :from => 'info@petcareco.com'

  def send_contact_reply_email(prospect)
    @prospect = prospect
    mail( :to => "#{prospect['email']}",
          :subject => "Thanks for contacting us!"
    )
  end

  def send_contact_email_to_owner(prospect)
    @prospect = prospect
    mail( :to => "#{prospect['email']}",
          :subject => "Customer Info Request in #{prospect['zip']} "
    )
  end

end
