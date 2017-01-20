class StaticPagesController < ApplicationController

  def home
    if current_user
      @contents = Content.where("page like ?", "%home%")
    else
      @contents = Content.where("page like ?", "%home%").reject { |c| !c.visible }[0..2]
    end
  end

  def contact
    # gets content and simple forms for contact
    if current_user
      @contents = Content.where("page like ?", "%contact%")
    else
      @contents = Content.where("page like ?", "%contact%").reject { |c| !c.visible }[0..2]
    end
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
    @prospect["phone"] = params[:phone]
    @prospect["address"] = params[:address]
    @prospect["start_date"] = params[:start_date]
    @prospect["about_pet"] = params[:about_pet]
    puts @prospect
    UserNotifierMailer.send_contact_reply_email(@prospect).deliver
    UserNotifierMailer.send_contact_email_to_owner(@prospect).deliver

    redirect_to contact_path
  end

end
