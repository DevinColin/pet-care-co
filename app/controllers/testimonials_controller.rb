class TestimonialsController < ApplicationController

  def index
    @testimonials = Testimonial.where(visible: true)
  end

end
