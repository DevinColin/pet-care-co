class StaticPagesController < ApplicationController

  def home
    @contents = Content.where("page like ?", "%home%")
  end

  def contact
    # gets content and simple forms for contact
    @contents = Content.where("page like ?", "%contact%")
  end

  def admin
    @walkers = Walker.order(active: :desc)
    @services = Service.order(active: :desc)
    @testimonials = Testimonial.order(visible: :desc)
  end

  def contact_email
    @prospect = {}
    @prospect["name"]= params[:name]
    @prospect["email"] = params[:email]
    @prospect["zip"] = params[:zip]
    puts @prospect
    puts :name
    puts :email
    puts :zip
    my_mailer = UserNotifierMailer.new
    if @prospect["zip"]
      my_mailer.send_contact_reply_email(@prospect)
      redirect_to contact_path
    # else
      # redirect_to root_path
    end
  end

end
