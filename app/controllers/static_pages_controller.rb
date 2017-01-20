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

end
