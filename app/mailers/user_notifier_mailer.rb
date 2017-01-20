class UserNotifierMailer < ApplicationMailer

  default :from => 'info@petcareco.com'

  def send_contact_reply_email(prospect)
    @prospect = prospect
    puts "---------------------"
    puts prospect
    puts @prospect
    puts "---------------------"
    mail( :to => @prospect["email"],
          :subject => "Thanks for contacting us!"
    )
  end

end
